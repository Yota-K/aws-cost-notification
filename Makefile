build:
	sam build

# -tags lambda.norpc: このタグをつけることで、go1.xランタイムでしか使用しないRPCコンポーネントを除外して、ビルド時のサイズを小さくすることができる
# ARTIFACTS_DIR: アーティファクトの配置先を格納する環境変数。ビルド後の成果物を配置するディレクトリ
build-CostNotificationLambda:
	GOOS=linux GOARCH=arm64 go build -tags lambda.norpc -o bootstrap
	cp ./bootstrap $(ARTIFACTS_DIR)/.

local_invoke:
	sam local invoke

deploy:
	sam deploy

test:
	go test -v ./...
