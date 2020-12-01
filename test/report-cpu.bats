#!/usr/bin/env bats

source "${BATS_TEST_DIRNAME}/test_helpers.sh"

@test "It report cgroup monitoring statistics." {
  start_elasticsearch

  # Elasticsearch won't report on cgroups if it can't access them, so we just check 
  # that "cgroup" is present in the output of the node stats.
  
  curl -ik https://aptible:password@localhost:9200/_nodes/${hostname}/stats/os?pretty=true | grep "cgroup"
}
