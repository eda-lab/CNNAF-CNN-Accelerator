./vcsmx_setup.sh | tee ./vcs_sim.log
cat vcs_sim.log | grep "Error" -A 3
