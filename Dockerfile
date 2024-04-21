FROM sgtwilko/rpi-raspbian-opencv:stretch-latest

# Install python dependencies
COPY requirements-pi.txt .
COPY requirements.txt .
RUN pip3 install -r requirements-pi.txt
RUN apt-get update
RUN apt-get install -y gpac

# Bundle source
COPY timelapse_camera_server timelapse_camera_server

# Expose port
EXPOSE 5000

# Run
CMD ["python3", "-m", "timelapse_camera_server"]
