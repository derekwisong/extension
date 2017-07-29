/*
 * extension.c - example q/kdb+ extension
 */

#include <stdio.h>
#include <string.h>

#include "k.h"

/*
 * print a q-string after copying it to
 * make a c-string
 */
K print(K x) {
	// if x is not a string, do not continue
	if (x->t != 10) return (K) 0;
	char c_str[x->i + 1];
	strcpy(c_str, kC(x));
	c_str[x->i] = '\0';
	printf("%s\n", c_str);
	return (K) 0;
}


/* 
 * print without copying a q-string to a 
 * null-terminated c-string.
 */
K print2(K x) {
	// if x is not a string, do not continue
	if (x->t != 10) return (K) 0;
	// print a q-string, which is not null-terminated
	printf("%.*s\n", x->i, kC(x));
	return (K) 0;
}