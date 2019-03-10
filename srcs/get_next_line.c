/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_next_line.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vsteffen <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/09/01 14:02:42 by vsteffen          #+#    #+#             */
/*   Updated: 2016/09/01 14:02:56 by vsteffen         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <libft.h>

static t_gnl	*ft_lstdict(t_gnl *lst, const int n)
{
	while (lst)
	{
		if (lst->fd == n)
			return (lst);
		lst = lst->next;
	}
	return (NULL);
}

static t_gnl	*gnl_add_elem(t_gnl **list, const int fd)
{
	t_gnl	*beginning;
	t_gnl	*elem;

	elem = malloc(sizeof(t_gnl));
	elem->fd = fd;
	elem->line = NULL;
	elem->next = NULL;
	if (!(*list))
	{
		*list = elem;
		return (elem);
	}
	beginning = (*list);
	while ((*list)->next)
		(*list) = (*list)->next;
	(*list)->next = elem;
	*list = beginning;
	return (elem);
}

static char		*strjoin_secure(char *s1, char *s2)
{
	char	*join;

	if (s1 == NULL && s2 == NULL)
		return (NULL);
	if (s1 == NULL)
	{
		join = ft_strdup(s2);
		return (join);
	}
	if (s2 == NULL)
		return (s1);
	join = ft_strjoin(s1, s2);
	ft_strdel(&s1);
	return (join);
}

static int		newline_detected(char **line,
		int flag, t_gnl *elem)
{
	char			*nl;

	if (flag == 0)
	{
		nl = ft_strchr(elem->line, '\n');
		*line = ft_strsub(elem->line, 0, nl - elem->line);
		ft_strcpy(elem->line, nl + 1);
		return (1);
	}
	*line = elem->line;
	elem->line = NULL;
	return (2);
}

int				get_next_line(const int fd, char **line)
{
	char			buff[BUFF_SIZE + 1];
	static t_gnl	*lst = NULL;
	t_gnl			*elem;
	int				ret;

	if (line == NULL || fd < 0)
		return (-1);
	if ((elem = ft_lstdict(lst, fd)) == NULL)
		elem = gnl_add_elem(&lst, fd);
	if ((elem->line && ft_strchr(elem->line, '\n') != NULL)
			&& elem->line && elem->line[0])
		return (newline_detected(line, 0, elem));
	while ((ret = read(fd, buff, BUFF_SIZE)) > 0)
	{
		buff[ret] = '\0';
		elem->line = strjoin_secure(elem->line, buff);
		if (ft_strchr(elem->line, '\n') != NULL)
			return (newline_detected(line, 0, elem));
	}
	if (ret == -1)
		return (-1);
	if (elem->line == NULL)
		return (((int)(elem->line = ft_strdup("")) & 0));
	newline_detected(line, 1, elem);
	return ((**line == 0) ? 0 : 2);
}
