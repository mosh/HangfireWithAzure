<?xml version="1.0" encoding="utf-8"?>
<Project DefaultTargets="Build" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" ToolsVersion="4.0">
  <PropertyGroup>
    <ProductVersion>3.5</ProductVersion>
    <ProjectGuid>{ff9c7c62-1073-4a30-9afb-7db842d220e7}</ProjectGuid>
    <ProjectTypeGuids>{349c5851-65df-11da-9384-00065b846f21};{656346D9-4656-40DA-A068-22D5425D4639}</ProjectTypeGuids>
    <OutputType>library</OutputType>
    <RootNamespace>AzureWebApplication</RootNamespace>
    <AssemblyName>AzureWebApplication</AssemblyName>
    <Configuration Condition="'$(Configuration)' == ''">Release</Configuration>
    <TargetFrameworkVersion>v4.5</TargetFrameworkVersion>
    <IISExpressUseClassicPipelineMode>true</IISExpressUseClassicPipelineMode>
    <Name>AzureWebApplication</Name>
    <UseIISExpress>true</UseIISExpress>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)' == 'Debug' ">
    <DefineConstants>DEBUG;TRACE;</DefineConstants>
    <OutputPath>./bin</OutputPath>
    <GeneratePDB>True</GeneratePDB>
    <GenerateMDB>True</GenerateMDB>
    <WarnOnCaseMismatch>True</WarnOnCaseMismatch>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)' == 'Release' ">
    <OutputPath>./bin</OutputPath>
    <EnableAsserts>False</EnableAsserts>
    <WarnOnCaseMismatch>True</WarnOnCaseMismatch>
  </PropertyGroup>
  <ItemGroup>
    <Reference Include="Microsoft.Owin">
      <HintPath>..\packages\Microsoft.Owin.3.0.0\lib\net45\Microsoft.Owin.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="Microsoft.Owin.Host.SystemWeb">
      <HintPath>..\packages\Microsoft.Owin.Host.SystemWeb.3.0.0\lib\net45\Microsoft.Owin.Host.SystemWeb.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="mscorlib">
      <HintPath>$(Framework)\mscorlib.dll</HintPath>
    </Reference>
    <Reference Include="Nancy">
      <HintPath>..\packages\Nancy.0.23.2\lib\net40\Nancy.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="Nancy.Owin">
      <HintPath>..\packages\Nancy.Owin.0.23.2\lib\net40\Nancy.Owin.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="Owin">
      <HintPath>..\packages\Owin.1.0\lib\net40\Owin.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="System" />
    <Reference Include="System.Configuration" />
    <Reference Include="System.Data" />
    <Reference Include="System.Drawing" />
    <Reference Include="System.EnterpriseServices" />
    <Reference Include="System.Web" />
    <Reference Include="System.Web.Mobile" />
    <Reference Include="System.Web.Services" />
    <Reference Include="System.Xml" />
    <Reference Include="System.Core">
      <RequiredTargetFramework>3.5</RequiredTargetFramework>
    </Reference>
    <Reference Include="System.Xml.Linq">
      <RequiredTargetFramework>3.5</RequiredTargetFramework>
    </Reference>
    <Reference Include="System.Data.DataSetExtensions">
      <RequiredTargetFramework>3.5</RequiredTargetFramework>
    </Reference>
  </ItemGroup>
  <ItemGroup>
    <Compile Include="AzureBootStrapper.pas" />
    <Compile Include="Modules\HomeModule.pas" />
    <Compile Include="Startup.pas" />
    <Content Include="Global.asax" />
    <Compile Include="Global.asax.pas">
      <DependentUpon>Global.asax</DependentUpon>
    </Compile>
    <Content Include="packages.config">
      <SubType>Content</SubType>
    </Content>
    <Content Include="Web.config" />
    <Compile Include="Properties\AssemblyInfo.pas" />
  </ItemGroup>
  <ItemGroup>
    <Folder Include="Modules" />
    <Folder Include="Properties\" />
  </ItemGroup>
  <ProjectExtensions>
    <VisualStudio>
      <FlavorProperties Guid="{349c5851-65df-11da-9384-00065b846f21}">
        <WebProjectProperties>
          <UseIIS>True</UseIIS>
          <AutoAssignPort>True</AutoAssignPort>
          <DevelopmentServerPort>51925</DevelopmentServerPort>
          <DevelopmentServerVPath>/</DevelopmentServerVPath>
          <IISUrl>http://localhost:51925/</IISUrl>
          <NTLMAuthentication>False</NTLMAuthentication>
          <UseCustomServer>False</UseCustomServer>
          <CustomServerUrl>
          </CustomServerUrl>
          <SaveServerSettingsInUserFile>False</SaveServerSettingsInUserFile>
        </WebProjectProperties>
      </FlavorProperties>
      <FlavorProperties Guid="{349c5851-65df-11da-9384-00065b846f21}" User="">
        <WebProjectProperties>
          <StartPageUrl>
          </StartPageUrl>
          <StartAction>CurrentPage</StartAction>
          <AspNetDebugging>True</AspNetDebugging>
          <SilverlightDebugging>False</SilverlightDebugging>
          <NativeDebugging>False</NativeDebugging>
          <SQLDebugging>False</SQLDebugging>
          <ExternalProgram>
          </ExternalProgram>
          <StartExternalURL>
          </StartExternalURL>
          <StartCmdLineArguments>
          </StartCmdLineArguments>
          <StartWorkingDirectory>
          </StartWorkingDirectory>
          <EnableENC>True</EnableENC>
          <AlwaysStartWebServerOnDebug>True</AlwaysStartWebServerOnDebug>
        </WebProjectProperties>
      </FlavorProperties>
    </VisualStudio>
  </ProjectExtensions>
  <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Oxygene\RemObjects.Oxygene.Echoes.targets" />
  <Import Project="$(MSBuildExtensionsPath)\Microsoft\VisualStudio\v12.0\WebApplications\Microsoft.WebApplication.targets" />
</Project>