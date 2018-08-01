# **************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    Makefile                                         .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: shthevak <marvin@le-101.fr>                +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2018/07/25 11:55:57 by shthevak     #+#   ##    ##    #+#        #
#    Updated: 2018/07/25 11:56:15 by shthevak    ###    #+. /#+    ###.fr      #
#                                                          /                   #
#                                                         /                    #
# **************************************************************************** #

.PHONY: all re clean fclean $(NAME)

NAME = fdf.a

EXEC = fdf

F_SRC = read_and_stock.c bresen.c main.c bonus.c\

SRC= $(addprefix ./, $(F_SRC))

OBJ = $(addprefix ./, $(F_SRC:.c=.o))

HEAD = ./fdf.h

FLAGS = -Wall -Wextra -Werror

F_FDF = -framework Appkit -framework OpenGL

all: $(NAME)

$(NAME): $(OBJ) $(HEAD)
	cd libft && $(MAKE)
	cd ./ && ar rcs $(NAME) libft/*.o $(OBJ)
	gcc $(FLAGS) $(OBJ) $(NAME) minilibx_macos/libmlx.a $(F_FDF)\
		libft/libft.a -o  $(EXEC)

%.o : %.c ./fdf.h
	gcc $(FLAGS) -I $(HEAD) -o $@ -c $<

clean:
	rm -f $(OBJ)
	cd libft && make clean

fclean:
	rm -f $(OBJ)
	rm -f $(NAME)
	rm -f $(EXEC)
	cd libft && make fclean

re: fclean all
