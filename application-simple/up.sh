pushd ../../test-network

./network.sh up createChannel -c mychannel -ca -s couchdb

./network.sh deployCC -ccs 1 -ccv 1 -ccep "OR('Org1MSP.peer','Org2MSP.peer')"  -ccl go -ccp ../asset-transfer-events/chaincode-simple-go/ -ccn asset-transfer-events-simple-go -cci InitAssetCounter

popd