# syntax=docker/dockerfile:1
FROM slechev/openwebrxplus

COPY --chmod=700 scripts/install_driver.sh /
RUN /install_driver.sh

