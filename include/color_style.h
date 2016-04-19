/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   color_style.h                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vsteffen <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/04/19 15:47:30 by vsteffen          #+#    #+#             */
/*   Updated: 2016/04/19 16:30:40 by vsteffen         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef COLOR_STYLE_H
# define COLOR_STYLE_H

# define CS_RESET = '\033[0m'
# define c_default = '\033[39m'
# define C_DEFAULT = '\033[49m'

# define bold = '\033[1m'
# define faint = '\033[2m'
# define standout = '\033[3m'
# define underline = '\033[4m'
# define blink = '\033[5m'
# define reverse = '\033[7m'
# define hidden = '\033[8m'
# define STANDOUT = '\033[23m'
# define UNDERLINED = '\033[24m'
# define BLINK = '\033[25m'
# define REVERSE = '\033[27m'

# define black = '\033[30m'
# define BLACK = '\033[40m'
# define red = '\033[31m'
# define RED = '\033[41m'
# define green = '\033[32m'
# define GREEN = '\033[42m'
# define yellow = "\033[33m"
# define YELLOW = '\033[43m'
# define blue = '\033[34m'
# define BLUE = '\033[44m'
# define magenta = '\033[35m'
# define MAGENTA = '\033[45m'
# define cyan = '\033[36m'
# define CYAN = '\033[46m'
# define white = '\033[37m'
# define WHITE = '\033[47m'

# define dgray = '\033[90m'
# define DGRAY = '\033[100m'
# define lred = '\033[91m'
# define LRED = '\033[101m'
# define lgreen = '\033[92m'
# define LGREEN = '\033[102m'
# define lyellow = '\033[93m'
# define LYELLOW = '\033[103m'
# define lblue = '\033[94m'
# define LBLUE = '\033[104m'
# define lmagenta = '\033[95m'
# define LMAGENTA = '\033[105m'
# define lcyan = '\033[96m'
# define LCYAN = '\033[106m'
# define lgray = '\033[97m'
# define LGRAY = '\033[107m'

#endif
