# Install Xamarin Components in maCOS 13 VM Images

## Check current Install Software

Installed Software and Tooling Versions for Azure DevOps Microsoft-hosted [here](https://learn.microsoft.com/en-us/azure/devops/pipelines/agents/hosted?view=azure-devops&tabs=yaml#software).

Installed Software and Tooling Versions for GitHub Actions GitHub-hosted images [here](https://github.com/actions/runner-images/tree/main?tab=readme-ov-file#about).

## Sample Pipelines
 - Azure DevOps : [azdo_pipeline.yaml](/azdo_pipeline.yaml)
 - GitHub Actions : [github_actions.yml](.github/workflows/main.yml)

## Using Custom Script 

The custom script can be found in the repo [install_xam.sh](/install_xam.sh). 

Before using script, be sure to set the `Version` numbers at the top of the script 

```
version_xam_ios="16.4.0.23"
version_xam_android="13.2.2.0"
```

Azure DevOps : 

```
- task: Bash@3
   displayName: Install Xamarin Components via custom Script
   inputs:
     targetType: 'inline'
     script: |
       chmod +x install_xam.sh
       ./install_xam.sh
```

GitHub Actions :

```
- name: Install Xamarin via Custom Script
     run: |
       sh install_xam.sh
```

## Using HomeBrew 

HomeBrew is pre-installed on the macOS-13 images. 

- Xamarin.iOS : https://formulae.brew.sh/cask/xamarin-ios
- Xamarin.Android : https://formulae.brew.sh/cask/xamarin-android


Azure DevOps :

```
- task: Bash@3
  displayName: Install Xamarin Components
  inputs:
    targetType: 'inline'
    script: |
      brew install --cask xamarin-ios
      brew install --cask xamarin-android
```

GitHub Actions : 
```
- name: Install Xamarin
  run: |
    brew install --cask xamarin-ios
    brew install --cask xamarin-android
```

## Using dotnet tool [boots](https://github.com/jonathanpeppers/boots/tree/main) 

> ⚠️ :warning: **boots tool is not actively maintained.**
For issues, fork the repo and make fixes as needed. 

For more information on [boots](https://github.com/jonathanpeppers/boots/tree/main), check the [repo](https://github.com/jonathanpeppers/boots/tree/main?tab=readme-ov-file#boots). 

Azure DevOps :
```
- task: Bash@3
  displayName: Install Xamarin Components via boots
  inputs:
    targetType: 'inline'
    script: |
      dotnet tool install -g boots
      boots --stable Xamarin.Android
      boots --stable Xamarin.iOS
```

GitHub Actions : 
```
- name: Install Xamarin via boots
  run: |
    dotnet tool install -g boots
    boots --stable Xamarin.Android
    boots --stable Xamarin.iOS
```


## Other Resources 

- Scripts from runner-images : https://github.com/actions/runner-images/blob/main/images/macos/scripts/helpers/xamarin-utils.sh 
