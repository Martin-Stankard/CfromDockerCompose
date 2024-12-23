# Use an official GCC image as the base image
FROM gcc:latest

# Set the working directory inside the container
WORKDIR /app

# Copy the C source code into the container
COPY src/ /app/src/

# Compile the C code (creating the executable 'hello')
RUN gcc -o hello src/main.c

# Command to run the compiled executable
CMD ["./hello"]
