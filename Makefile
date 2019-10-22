obj-m += ionopimax.o

ionopimax-objs := module.o soft_uart/raspberry_soft_uart.o soft_uart/queue.o

all:
	make -C /lib/modules/$(shell uname -r)/build/ M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build/ M=$(PWD) clean

install:
	sudo install -m 644 -c ionopimax.ko /lib/modules/$(shell uname -r)
	sudo depmod
