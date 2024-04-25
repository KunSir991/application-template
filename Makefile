define generateService
	@echo "generate ros template for $1"
	# generate ros templates
	computenest-cli generate --file_path=code_generation/ros_templates/single_ecs.yaml  --parameter_path=code_generation/values/$1-values.yaml --output_path=targets/ros_templates/$1_single_ecs.yaml | tee targets/build_$1.out
	computenest-cli generate --file_path=code_generation/ros_templates/elastic_ecs_cluster.yaml  --parameter_path=code_generation/values/$1-values.yaml --output_path=targets/ros_templates/$1_elastic_ecs_cluster.yaml | tee targets/build_$1.out
	computenest-cli generate --file_path=code_generation/ros_templates/elastic_web_backend.yaml  --parameter_path=code_generation/values/$1-values.yaml --output_path=targets/ros_templates/$1_elastic_web_backend.yaml | tee targets/build_$1.out
	computenest-cli generate --file_path=code_generation/ros_templates/dingtalk.yaml  --parameter_path=code_generation/values/$1-values.yaml --output_path=targets/ros_templates/$1_dingtalk.yaml | tee targets/build_$1.out
	# generate config.yaml
	@echo "generate config.yaml for $1"
	computenest-cli generate --file_path=code_generation/service_configs/application-environment-service-config.yaml  --parameter_path=code_generation/values/$1-values.yaml --output_path=targets/service_configs/$1.yaml | tee targets/build_$1.out
	# generate compute nest service
	@echo "generate compute nest service for $1"
 	computenest-cli import  --file_path targets/service_configs/$1.yaml --update_artifact ${UpdateArtifact} --access_key_id ${AK} --access_key_secret ${AKSecret} --version_name "updated from git code" | tee targets/build_$1.out
endef

init:
	pip install -r requirements.txt

clean:
	rm -rf targets
	
prepare: clean
	mkdir -p targets
	cp -r resources ros_templates service_configs targets

lnmp: prepare
	$(call generateService,lnmp)

lamp: prepare
	$(call generateService,lamp)

nodejs: prepare
	$(call generateService,nodejs)

flask: prepare
	$(call generateService,flask)

java: prepare
	$(call generateService,java)

all: lnmp lamp nodejs flask java