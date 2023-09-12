FROM ghcr.io/pulp/pulp-ci-centos:latest

RUN dnf -y install which

RUN curl -o /usr/bin/switch_python https://raw.githubusercontent.com/pulp/oci_env/main/base/switch_python
RUN chmod +x /usr/bin/switch_python
RUN switch_python 3.11

RUN curl -o /tmp/integration_requirements.txt https://raw.githubusercontent.com/ansible/galaxy_ng/master/integration_requirements.txt
RUN python3 -m venv /tmp/gng_testing
RUN python3 -m pip install -r /tmp/integration_requirements.txt

RUN curl -o /tmp/requirements.common.txt https://raw.githubusercontent.com/ansible/galaxy_ng/master/requirements/requirements.common.txt
RUN python3 -m pip install -r /tmp/requirements.common.txt

