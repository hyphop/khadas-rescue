//## hyphop ##

// run simple plain script without mkimage packages

#include <common.h>
#include <command.h>
#include <image.h>
#include <malloc.h>
#include <asm/byteorder.h>

int
script (ulong addr )
{
	int		len = 32767;
	void		*buf;

	buf = map_sysmem(addr, 0);

	char		*data;

	data = (char *)buf;

	char *p = strstr( data , "##END##");

	if (p != NULL) {
	    len = p - data;
	} else {
	    p = strstr( data , "\0" );
	    if (p != NULL) {
		len = p - data;
	    }
	}

        printf ("** Script length: %d \n", len ) ;
//      printf ("!! Script length: %d :: %s\n", len , data);

	return run_command_list(data, len, 0);

	unmap_sysmem(buf);

	return 0;

}

/**************************************************/

int do_script (cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[])
{
	ulong addr;
	int rcode;

	if ( argc < 2 )  {
	    printf ("[e] not defined addr\n");
	    return -1;
	}

	addr = simple_strtoul(argv[1], NULL, 16);

	printf ("## Executing plain script - %08lx\n", addr);

	rcode = script (addr  );

	 
	return rcode;
}

U_BOOT_CMD(
	script, 2, 1,	do_script,
	"run plain script from memory\n",
	"[addr] - run script starting at addr\n"
	"[bytes] - read bytes limit"
);
