/* ************************************************************************** */
/*                                                          LE - /            */
/*                                                              /             */
/*   ft_strrev.c                                      .::    .:/ .      .::   */
/*                                                 +:+:+   +:    +:  +:+:+    */
/*   By: jdarko <marvin@le-101.fr>                  +:+   +:    +:    +:+     */
/*                                                 #+#   #+    #+    #+#      */
/*   Created: 2017/11/22 22:55:06 by jdarko       #+#   ##    ##    #+#       */
/*   Updated: 2017/11/22 22:55:06 by jdarko      ###    #+. /#+    ###.fr     */
/*                                                         /                  */
/*                                                        /                   */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strrev(char *src)
{
	int		i;
	int		j;
	char	*dest;

	if (!src)
		return (NULL);
	i = 0;
	dest = ft_strdup(src);
	j = ft_strlen(src);
	j--;
	while (j >= 0)
	{
		dest[i] = src[j];
		i++;
		j--;
	}
	dest[i] = '\0';
	return (dest);
}
