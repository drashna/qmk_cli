FROM ghcr.io/drashna/qmk_base_container:latest

# Copy package in
ADD dist /tmp/dist

# Install python packages
RUN python3 -m pip uninstall -y qmk --break-system-packages || true
RUN python3 -m pip install /tmp/dist/qmk-*.whl --break-system-packages && \
    rm -rf /tmp/dist

# Set the default location for qmk_firmware
ENV QMK_HOME=/qmk_firmware
