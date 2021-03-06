#!/bin/bash
# ------------------------------------------------------------------------
#
# Copyright 2016 WSO2, Inc. (http://wso2.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License

# ------------------------------------------------------------------------

set -e

product_name=$2
product_profile=$1

echo "undeploy ====> ${product_name}-${product_profile}"

if [[ ! -z $product_profile ]]; then
    kubectl delete rc,services,pods -l name="${product_name}-${product_profile}"
else
    kubectl delete rc,services,pods -l name="${product_name}"
fi
