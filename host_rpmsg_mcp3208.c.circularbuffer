/**
 * Based on examples from Texas Instruments PRU Hands-on Labs.
 */

#include <inttypes.h>
#include <stdio.h>
#include <stdint.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <time.h>

uint8_t readBuf[512];
#define DEVICE_NAME  "/dev/rpmsg_pru1"

#define NUM_SCAN_ELEMENTS  4
#define NUM_SCANS          60
#define DATA_BUFFER_LEN    (NUM_SCAN_ELEMENTS * NUM_SCANS)
#define BUFFER_WORD_LEN    2 + DATA_BUFFER_LEN/2
#define		MAX_BUFFER_SIZE		10000000000	// 10 segundos
#define		CIRCULAR_BUFFER		1000000000		// 1 Segundo (nanosegundos)

int ch[NUM_SCAN_ELEMENTS][CIRCULAR_BUFFER] = { 0 };	// Empty circular buffer
int buffer_10s[MAX_BUFFER_SIZE] = { 0 };	// Empty 10s buffer
int readIndex =	0;	// Index of the read pointer
int writeIndex =	0;	// Index of the write pointer
int bufferLength =	0;	// Number of values in circular buffer
int count = 0;  	// Index of buffer_10s / end of loop
int trigger = 0;  	// Trigger to change from circular buffer to 10s buffer
char namefile[20]		;	// Record the date of the signal

typedef struct {
  uint64_t timestamp_ns;
  uint16_t data[DATA_BUFFER_LEN];
} Buffer;

//Função que grava os arquivos do buffer circular
void buffer1 (int d[][], int n, char namefile[])
{
	char buf[30];
	snprintf(buf, sizeof buf,  "%s-1.txt", namefile);
	int i = 0;
	FILE *fl1;
	fl1 = fopen(buf, "w");

	for(i = 0; i <= n ; i++){
		fprintf(fl1, "%d/t", d[i % NUM_SCAN_ELEMENTS][i % CIRCULAR_BUFFER]);
    if(i % NUM_SCAN_ELEMENTS == NUM_SCAN_ELEMENTS -1)
      fprintf(fl1, "\n");
	}
	fclose(fl1);
}
/* Fim da impressão do Buffer circular */

//Função que grava os arquivos do buffer_10s
void buffer10 (int d[][], int n, char namefile[])
{
	char buf[30];
	snprintf(buf, sizeof buf,  "%s-2.txt", namefile);
	int i = 0;
	FILE *fl2;
	fl2 = fopen(buf, "w");

	for(i = 0; i <= n ; i++){
		fprintf(fl2, "%d/t", d[i % NUM_SCAN_ELEMENTS][i % CIRCULAR_BUFFER]);
    if(i % NUM_SCAN_ELEMENTS == NUM_SCAN_ELEMENTS -1)
      fprintf(fl2, "\n");
	}
	fclose(fl2);
}

int main(void) {
  time_t t = time(NULL);
  struct tm tm = *localtime(&t);

  /* Open the rpmsg_pru character device file */
  int fd = open(DEVICE_NAME, O_RDWR);
  if (fd < 0) {
    perror("Failed to open " DEVICE_NAME);
    return -1;
  }

  uint64_t last_ts = 0;
  for(;;) {
    /* Kick the PRU through the RPMsg channel */
    int result = write(fd, 0, 0);
    if (result < 0) {
      perror("Error writing to PRU");
      return -1;
    }
    // Read the data from the PRU.
    result = read(fd, readBuf, sizeof readBuf);
    if (result == sizeof(Buffer)) {
      Buffer *b = (Buffer *) readBuf;
      for (int i=0; i<DATA_BUFFER_LEN; i++){ 
      /* printf("ch%d=%4" PRIu16 ", ", i % NUM_SCAN_ELEMENTS , ch[i % NUM_SCAN_ELEMENTS][i % NUM_SCANS]);
      if(i % NUM_SCAN_ELEMENTS == NUM_SCAN_ELEMENTS - 1){
      printf("ts=%" PRIu64 ",\t", b->timestamp_ns);
      printf("delta=%" PRIu64, b->timestamp_ns - last_ts);
      printf("\n");} //apenas teste */ 
       if( trigger == 0 && b->data[i] > 1500 ) {
         trigger = 1;
         snprintf(namefile, sizeof namefile, "%02d-%02d-%d_%02dh%02dm%02d", tm.tm_mday, tm.tm_mon + 1, tm.tm_year + 1900, tm.tm_hour, tm.tm_min, tm.tm_sec);
         printf("Pulso Capturado, trigger %d\n\n", trigger);
         last_ts = b->timestamp_ns;}
        /* Inicio da coleta do 1 segundos buffer circular */
        if(trigger == 0){
        ch[i % NUM_SCAN_ELEMENTS][writeIndex % CIRCULAR_BUFFER] = b->data[i];
        writeIndex++;
        if(b->timestamp_ns - last_ts < CIRCULAR_BUFFER){
          bufferLength++;}
        if (writeIndex == bufferLength) {
          writeIndex = 0;}}
        /* Inicio da coleta dos 10 segundos real-time */
        if(trigger == 1){
          buffer_10s[i % NUM_SCAN_ELEMENTS][i % MAX_BUFFER_SIZE] = b->data[i];
          if(b->timestamp_ns - last_ts < CIRCULAR_BUFFER){
          count++;}/* Fim Coleta */} //fim da captura de um buffer da pru0
      //last_ts = b->timestamp_ns;//apenas para teste
      if(count == MAX_BUFFER_SIZE){
        printf("Impressao dos valores de buffer de 1s\n");
        buffer1(ch, bufferLength, namefile); 
        printf("Fim da impressao buffer 1 s \n Impressao dos valores de buffer 10s\n");
        buffer10(buffer_10s, count, namefile);
        printf("Fim da impressao");}
    } else if (result < 0) {
      perror("Error reading from device");
      return -1;
    } else {
      unsigned bufsz = sizeof(Buffer);
      printf("[[read only %d bytes, buffer size %u]]\n", result, bufsz);
    }
  }
  
  fsync(0);
  close(fd);
  return 0;
}

