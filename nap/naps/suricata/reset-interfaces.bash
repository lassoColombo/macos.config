for ns in $(ip netns | awk '{print $1}')
do
  for iface in $(kubectl get nodes -o jsonpath='{.items[0].metadata.labels.spanport}' | tr '-' '\n')
  do
    ip netns exec $ns ip link set $iface netns 1 2> /dev/null
  done
done;kubectl rollout restart -n minicon daemonset ids

