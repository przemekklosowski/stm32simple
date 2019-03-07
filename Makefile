# arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -c -o main.o main.c
# arm-none-eabi-as -o startup.o startup.s 
# arm-none-eabi-ld -T linker.ld -o main.elf startup.o main.o
# arm-none-eabi-objcopy -O binary main.elf main.bin

ARM_PREFIX=arm-none-eabi
CC=$(ARM_PREFIX)-gcc
COPTS=-mcpu=cortex-m3 -mthumb -c -O3
AS=$(ARM_PREFIX)-as
LD=$(ARM_PREFIX)-ld
CP=$(ARM_PREFIX)-objcopy

main.bin: main.elf
	$(CP) -O binary $^ $@

main.elf: startup.o main.o
	$(LD) -T linker.ld -o $@ $^

main.o: main.c
	$(CC) $(COPTS) -o $@ $^

startup.o: startup.s
	$(AS) -o $@ $^

clean:
	rm main.o startup.o main.elf main.bin

