NVCC = /usr/bin/nvcc

NVCC_FLAGS = -I/usr/include -lineinfo

# make emu=1 compiles the CUDA kernels for emulation
ifeq ($(emu),1)
	NVCC_FLAGS += -deviceemu
endif

all: ParallelSine

ParallelSine: ParallelSine.cu
	$(NVCC) $(NVCC_FLAGS) ParallelSine.cu -o ParallelSine -lcuda

clean:
	rm -f *.o *~ ParallelSine

	
