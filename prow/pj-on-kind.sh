#!/usr/bin/env bash
# Copyright 2019 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Runs prow/pj-on-kind.sh with config arguments specific to the prow.istio.io instance.
# Requries go, docker, and kubectl.

# Example usage:
# ./pj-on-kind.sh pull-test-infra-prow-checkconfig

set -o errexit
set -o nounset
set -o pipefail

# shellcheck disable=SC2155
# shellcheck disable=SC2046
export CONFIG_PATH="$(readlink -f $(dirname "${BASH_SOURCE[0]}")/config.yaml)"
# shellcheck disable=SC2155
# shellcheck disable=SC2046
export JOB_CONFIG_PATH="$(readlink -f $(dirname "${BASH_SOURCE[0]}")/cluster/jobs)"

bash <(curl -sSfL https://raw.githubusercontent.com/kubernetes/test-infra/master/prow/pj-on-kind.sh) "$@"
