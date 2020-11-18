#the WORKSPACE parameter is default path from jenkins

echo "$1"

if [[ -z $1 ]];
then
    echo "variable WORKSPACE not set. load local path"
    export PROJECT_ROOT=/home/jkchoi/Documents/git/MultiSwitch
else
    echo "variable WORKSPACE is set. load jenkins path"
    export PROJECT_ROOT=$1
fi

echo "PROJECT_ROOT is $PROJECT_ROOT"

# export PROJECT_ROOT=${WORKSPACE:=/home/jkchoi/Documents/git/MultiSwitch}
export P4_PROJECT_PIFO_MODULES_DIR=$PROJECT_ROOT/targets/p4-netfpga-scheduler/pifo_simulation_modules/V0.1_root_only
export P4_PROJECT_DEMO_TCL=p4_pifo_demo
export TEST_SIM_DIR=$P4_PROJECT_PIFO_MODULES_DIR/test
export PROJECT_IP_PATH=$P4_PROJECT_PIFO_MODULES_DIR/regression_test_scripts/regression/template
export PROJECT_TEMPLATE_PATH=$P4_PROJECT_PIFO_MODULES_DIR/templates
