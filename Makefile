CXX = nvcc
CXX_FLAGS = -g -O3 -arch=sm_80
CXX_LIBS =
BIN = md5_gpu

main:
	$(CXX) $(CXX_FLAGS) md5_gpu.cu -o $(BIN) $(CXX_LIBS)

clean:
	rm $(BIN)
