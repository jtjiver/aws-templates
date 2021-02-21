import * as cdk from "@aws-cdk/core";
import * as amplify from "@aws-cdk/aws-amplify";

export class AmplifyInfraStack extends cdk.Stack {
  constructor(scope: cdk.Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    //Creation of the Amplify Application
    const amplifyApp = new amplify.App(this, "react-app-github-amplify ", {
      sourceCodeProvider: new amplify.GitHubSourceCodeProvider({
        owner: "jtjiver",
        repository: "amplify-react-test-repo",
        oauthToken: cdk.SecretValue.secretsManager("aws-github-token", {
          jsonField: "oauthToken",
        }),
      }),
    });
    const masterBranch = amplifyApp.addBranch("master");
  }
}
