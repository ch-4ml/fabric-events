pushd ./application-simple

rm -rf wallet

popd

pushd ../test-network

./network.sh down

popd