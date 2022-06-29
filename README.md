# Asset Transfer Events Sample

이 예제에서는 체인코드 이벤트를 보내고 받는 과정, 블록 이벤트를 받는 과정을 웹 애플리케이션을 통해 보여줍니다.
먼저, 체인코드 작성 시 트랜잭션에 이벤트 데이터를 추가하도록 설정합니다.
그러면 해당 체인코드가 포함된 트랜잭션이 원장에 커밋될 때 설정한 체인코드 이벤트가 발생합니다. 블록 이벤트는 블록이 원장에 커밋될 때 발생하며 해당 블록 내 모든 트랜잭션의 세부 정보를 포함합니다.

> 채널 별 이벤트 서비스에 대한 자세한 내용은 Fabric Docs의
> [Channel-based event service](https://hyperledger-fabric.readthedocs.io/en/latest/peer_event_services.html) 페이지를 참조하세요.

## About the Sample

- 이 예제는 Hyperledger Fabric 2.2.3 버전에서 정상적으로 동작합니다.
- go 언어로 작성된 체인코드와 node.js 환경에서 동작하는 애플리케이션 코드를 포함합니다.
- ID와 Color 속성만을 포함하는 단순한 자산 구조를 사용하고 있습니다.
- 세 종류의 색상 중 한 가지를 무작위로 선택하여 자산을 생성합니다.
- 생성한 자산의 색상에 따라 다른 이벤트가 발생합니다.
- 애플리케이션에서 발생한 이벤트를 수신하고 소켓을 통해 클라이언트로 전달합니다.

### Application

이 애플리케이션에서는 한 가지 유형의 listener를 사용합니다.

1. Contract Listener: 특정 contract의 (체인코드) 이벤트를 수신합니다.

- 애플리케이션에 contract listener를 등록하는 방법을 다룹니다.
- 체인코드 이벤트로부터 체인코드 이벤트의 이름과 값을 가져오는 방법을 다룹니다.
- 체인코드 이벤트로부터 트랜잭션 정보와 블록의 정보를 가져오는 방법을 다룹니다.

애플리케이션을 실행하는 동안 `application-simple/routes/index.js` 파일의 주석과 콘솔 출력을 참고하세요.

애플리케이션은 다음 순서로 동작합니다.

- 체인코드 호출 (콘솔 출력은 다음과 같습니다 `--> Submit CreateAsset([색상])`)
- 애플리케이션에서 이벤트 수신 (콘솔 출력은 다음과 같습니다. `<-- Contract Event Received: [이벤트명] - [색상]`)

Listener는 이벤트를 <b>비동기</b>적으로 수신합니다. 이벤트는 애플리케이션 코드가 트랜잭션을 전송한 후(또는 변경 사항이 원장에 커밋된 후) 다른 활동 중에 수신될 수 있습니다.

### Smart Contract

`chaincode-simple-go` 디렉토리에 구현된 체인코드는 다음과 같은 함수들로 구성되어 있습니다.

- InitAssetCounter
- CreateAsset
- ReadAsset
- ReadAllAssets

이벤트 송수신 사용만을 보여주기 위해 단순하게 구성되어 있습니다.

## Running the sample

`fabric-samples`의 `test-network`를 사용하여 예제를 배포하고 실행합니다. 다음 단계를 순서대로 수행하십시오.

- 이 repository의 파일을 모두 clone 또는 download하세요.

```
git clone https://github.com/ch-4ml/fabric-events-web.git
```

- Download한 파일을 모두 로컬 환경에 구성된 `fabric-samples/asset-transfer-events/` 디렉토리에 복사하세요.
- 아래 코드는 `fabric-samples` 디렉토리가 사용자의 `home` 디렉토리 (`/home/[username]`)에 구성되어 있음을 전제합니다.

```
.../fabric-events-web $ cp -r . ~/fabric-samples/asset-transfer-events/
```

- 네트워크를 구성하고 체인코드를 배포합니다.

```
~/fabric-samples/asset-transfer-events/application-simple $ ./up.sh
```

- 애플리케이션을 실행합니다.

```
~/fabric-samples/asset-transfer-events/application-simple $ npm install
~/fabric-samples/asset-transfer-events/application-simple $ node app.js
```

- 웹 페이지(localhost:3000)에 접속해서 테스트를 수행합니다.

## Clean up

- 테스트를 완료하면 네트워크를 종료할 수 있습니다.
- 다음 명령은 구동한 네트워크의 모든 컴포넌트를 제거하고 생성한 데이터를 삭제합니다.
- 지갑을 삭제하는 명령을 포함하고 있습니다.

```
~/fabric-samples/asset-transfer-events/application-simple $ ./down.sh
```
