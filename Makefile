# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vsteffen <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/02/06 20:52:05 by vsteffen          #+#    #+#              #
#    Updated: 2020/02/12 19:28:08 by vsteffen         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

PROJECT	=	Libft
NAME	=	libft.a

CC		=	/usr/bin/clang
RM		=	/bin/rm
MAKE	=	/usr/bin/make
MKDIR	=	/bin/mkdir -p
AR		=	/usr/bin/ar
RANLIB	=	/usr/bin/ranlib
GIT		=	/usr/bin/git

OBJ		=	$(patsubst %.c, $(OPATH)/%.o, $(SRC))

CFLAGS	=	-Wall -Wextra -Werror -g

ROOT	=	$(shell /bin/pwd)
OPATH	=	$(ROOT)/objs
CPATH	=	$(ROOT)/srcs
HPATH	=	-I $(ROOT)/includes
PRINTF	=	/ft_printf
ASMPATH	=	$(ROOT)/LibftASM
ASMOBJS	=	$(OPATH)/ft_cat.o \
			$(OPATH)/ft_puts.o

SRC	=	ft_atoi.c \
		ft_bzero.c \
		ft_isalnum.c \
		ft_isalpha.c \
		ft_isascii.c \
		ft_isdigit.c \
		ft_islower.c \
		ft_isspace.c \
		ft_isupper.c \
		ft_isprint.c \
		ft_itoa.c \
		ft_d_extract_round_int_part.c \
		ft_dtoa.c \
		ft_dtoa_clean.c \
		ft_itoa_base.c \
		ft_itoa_base_alph.c \
		ft_memalloc.c \
		ft_memccpy.c \
		ft_memchr.c \
		ft_memcmp.c \
		ft_memcpy.c \
		ft_memdel.c \
		ft_memmove.c \
		ft_memset.c \
		ft_putchar.c \
		ft_putchar_fd.c \
		ft_putendl.c \
		ft_putendl_fd.c \
		ft_putnbr.c \
		ft_putnbr_fd.c \
		ft_putstr.c \
		ft_putstr_fd.c \
		ft_strcat.c \
		ft_strchr.c \
		ft_strclr.c \
		ft_strcmp.c \
		ft_strcpy.c \
		ft_strdel.c \
		ft_strdup.c \
		ft_strequ.c \
		ft_striter.c \
		ft_striteri.c \
		ft_strjoin.c \
		ft_strlcat.c \
		ft_strlen.c \
		ft_strmap.c \
		ft_strmapi.c \
		ft_strncat.c \
		ft_strncmp.c \
		ft_strncpy.c \
		ft_strnequ.c \
		ft_strnew.c \
		ft_strnstr.c \
		ft_strrchr.c \
		ft_strsplit.c \
		ft_strstr.c \
		ft_strsub.c \
		ft_strtrim.c \
		ft_tolower.c \
		ft_strtoupper.c \
		ft_strtolower.c \
		ft_toupper.c \
		ft_clear.c \
		ft_color_style.c \
		get_next_line.c \
		ft_rounded.c \
		ft_swap_str.c \
		ft_swap_char.c \
		ft_swap_int.c \
		ft_qsort_tab_int.c \
		ft_qsortr_tab_int.c \
		ft_qsort_tab_str.c \
		ft_qsortr_tab_str.c \
		ft_itoa_base.c\
		ft_strjoinaf1.c \
		ft_strjoinaf2.c \
		ft_strjoinaf12.c \
		ft_abs.c \
		ft_sqrt.c \
		ft_iterative_factorial.c \
		ft_recursive_factorial.c \
		ft_range.c \
		ft_foreach.c \
		ft_pow_int64.c \
		ft_length_numeral_int64.c \
		$(PRINTF)/print.c \
		$(PRINTF)/arg_list.c \
		$(PRINTF)/flag.c \
		$(PRINTF)/flag_color1.c \
		$(PRINTF)/flag_color2.c \
		$(PRINTF)/ft_printf.c \
		$(PRINTF)/length_conversion1.c \
		$(PRINTF)/length_conversion2.c \
		$(PRINTF)/length_conversion3.c \
		$(PRINTF)/parser.c \
		$(PRINTF)/parser_conv.c \
		$(PRINTF)/parser_mod.c \
		$(PRINTF)/parser_flag.c \
		$(PRINTF)/transform_base1.c \
		$(PRINTF)/transform_base2.c \
		$(PRINTF)/transform_d.c \
		$(PRINTF)/transform_f1.c \
		$(PRINTF)/transform_f2.c \
		$(PRINTF)/transform_gen.c \
		$(PRINTF)/transform_p.c \
		$(PRINTF)/transform_cs.c \
		$(PRINTF)/transform_wide1.c \
		$(PRINTF)/transform_wide2.c \
		ft_hexstr_to_int64.c \
		ft_int64_to_array.c \
		ft_strsplitwhite.c


PRE_CHECK_SUB_LIBFTASM	=	$(ASMPATH)/Makefile
PRE_CHECK_SUB	=	$(PRE_CHECK_SUB_LIBFTASM)
# PRE_CHECK_LIB_LIBFTASM	=	$(ASMPATH)/libfts.a
# PRE_CHECK_LIB	=	$(PRE_CHECK_LIB_LIBFTASM)

COMPILE = no

OS		:= $(shell uname -s)

ifeq ($(OS),Darwin)
	NPROCS:=$(shell sysctl -n hw.ncpu)
else
	NPROCS:=$(shell grep -c ^processor /proc/cpuinfo)
endif


define PRINT_RED
    @printf "\033[31m$(1)\033[0m"
endef

define PRINT_GREEN
    @printf "\033[32m$(1)\033[0m"
endef

define PRINT_YELLOW
    @printf "\033[33m$(1)\033[0m"
endef

define PRINT_STATUS
	@printf '['
	$(if $(filter $(2),SUCCESS),$(call PRINT_GREEN,$(1)))
	$(if $(filter $(2),FAIL),$(call PRINT_RED,$(1)))
	$(if $(filter $(2),WARN),$(call PRINT_YELLOW,$(1)))
	$(if $(filter $(2),INFO),printf $(1))
	$(if $(filter $(3),-n),printf $(1),echo ']')
endef


.PHONY: all clean fclean re with-asm lib-clean lib-update pre-check-lib

all: $(NAME)

$(PRE_CHECK_SUB):
	@echo $(PROJECT)": Init submodules ... "
	@$(GIT) submodule update --init --recursive > /dev/null  # can't directly redirect stdout on /dev/null cause of sync wait on Linux
	@printf $(PROJECT)": submodules "
	@$(call PRINT_STATUS,INITIALIZED,SUCCESS)

pre-check-lib: $(PRE_CHECK_SUB)
	$(if $(filter $(MAKECMDGOALS),with-asm),@-$(MAKE) -C $(ASMPATH) -j$(NPROCS); cp $(ASMPATH)/includes/libfts.h $(ROOT)/includes)

with-asm: $(PRE_CHECK_LIB) $(OPATH) $(OBJ)
	$(if $(filter $(COMPILE),yes),@echo ']')
	@echo $(PROJECT)": Replace objects with ASM objects"
	@cp -rf $(ASMPATH)/objs $(ROOT)
	@printf $(PROJECT)": Building $@ with ASM functions ... "
	@$(AR) rc $(NAME) $(OBJ) $(ASMOBJS)
	@$(RANLIB) $(NAME)
	@$(call PRINT_STATUS,DONE,SUCCESS)

$(NAME): $(PRE_CHECK_LIB) $(OPATH) $(OBJ)
	$(if $(filter $(COMPILE),yes),@echo ']')
	@printf $(PROJECT)": Building $(NAME) without ASM functions ... "
	@$(AR) rc $(NAME) $(OBJ)
	@$(RANLIB) $(NAME)
	@$(call PRINT_STATUS,DONE,SUCCESS)

$(OPATH)/%.o: $(CPATH)/%.c | pre-check-lib
	$(if $(filter $(COMPILE),no),@printf $(PROJECT)': Files compiling [')
	@$(eval COMPILE := yes)
	@$(CC) $(CFLAGS) -c $< -o $@ $(HPATH)
	$(call PRINT_GREEN,.)

$(OPATH):
	@echo $(PROJECT)": Creation of objects directory"
	@$(MKDIR) $@ $@$(PRINTF)

clean:
	@$(RM) -Rf $(OPATH)
	@-$(MAKE) clean -C $(ASMPATH)
	@echo $(PROJECT)": Objects cleaned "
	@printf $(PROJECT)": clean rule "
	@$(call PRINT_STATUS,DONE,SUCCESS)

fclean: clean
	@$(RM) -f $(NAME)
	@echo $(PROJECT)": executable clean"
	@-$(MAKE) fclean -C $(ASMPATH)
	@printf $(PROJECT)": fclean rules "
	@$(call PRINT_STATUS,DONE,SUCCESS)

re: fclean
	@$(MAKE) -C $(ROOT) -j$(NPROCS)

lib-clean:
	@echo $(PROJECT)": cleaning libraries ..."
	@-$(MAKE) -C $(ASMPATH) fclean -j$(NPROCS)
	@printf $(PROJECT)": $@ rule "
	@$(call PRINT_STATUS,DONE,SUCCESS)

lib-update:
	@echo $(PROJECT)": Update submodules ... "
	@$(GIT) submodule update --recursive --remote > /dev/null
	@printf $(PROJECT)": submodules "
	@$(call PRINT_STATUS,UPDATED,SUCCESS)
