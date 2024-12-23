# Use an official GCC image as the base image
FROM gcc:latest

# Set the working directory inside the container
WORKDIR /app

# Copy the C source code into the container
COPY src/ /app/src/

# Install inotify-tools (optional but helpful for file change monitoring)
RUN apt-get update && apt-get install -y inotify-tools

# Compile the C code
RUN gcc -o hello src/main.c

# Command to watch for changes in the source and recompile
CMD ["sh", "-c", "inotifywait -m /app/src/main.c | while read; do gcc -o hello src/main.c; ./hello; done"]
