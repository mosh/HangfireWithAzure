<?xml version="1.0" encoding="utf-8"?>
<Project DefaultTargets="Build" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" ToolsVersion="4.0">
  <PropertyGroup>
    <ProductVersion>3.5</ProductVersion>
    <RootNamespace>HangFireConsoleApplication</RootNamespace>
    <ProjectGuid>{258240c7-fb60-47e4-9321-ab1ebf2aef31}</ProjectGuid>
    <OutputType>exe</OutputType>
    <AssemblyName>HangFireConsoleApplication</AssemblyName>
    <AllowGlobals>False</AllowGlobals>
    <AllowLegacyWith>False</AllowLegacyWith>
    <AllowLegacyOutParams>False</AllowLegacyOutParams>
    <AllowLegacyCreate>False</AllowLegacyCreate>
    <AllowUnsafeCode>False</AllowUnsafeCode>
    <ApplicationIcon>Properties\App.ico</ApplicationIcon>
    <Configuration Condition="'$(Configuration)' == ''">Release</Configuration>
    <TargetFrameworkVersion>v4.5</TargetFrameworkVersion>
    <Name>HangFireConsoleApplication</Name>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)' == 'Debug' ">
    <Optimize>false</Optimize>
    <OutputPath>.\bin\Debug</OutputPath>
    <DefineConstants>DEBUG;TRACE;</DefineConstants>
    <GeneratePDB>True</GeneratePDB>
    <GenerateMDB>True</GenerateMDB>
    <EnableAsserts>True</EnableAsserts>
    <TreatWarningsAsErrors>False</TreatWarningsAsErrors>
    <CaptureConsoleOutput>False</CaptureConsoleOutput>
    <StartMode>Project</StartMode>
    <RegisterForComInterop>False</RegisterForComInterop>
    <CpuType>anycpu</CpuType>
    <RuntimeVersion>v25</RuntimeVersion>
    <XmlDoc>False</XmlDoc>
    <XmlDocWarningLevel>WarningOnPublicMembers</XmlDocWarningLevel>
    <EnableUnmanagedDebugging>False</EnableUnmanagedDebugging>
    <WarnOnCaseMismatch>True</WarnOnCaseMismatch>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)' == 'Release' ">
    <Optimize>true</Optimize>
    <OutputPath>.\bin\Release</OutputPath>
    <GeneratePDB>False</GeneratePDB>
    <GenerateMDB>False</GenerateMDB>
    <EnableAsserts>False</EnableAsserts>
    <TreatWarningsAsErrors>False</TreatWarningsAsErrors>
    <CaptureConsoleOutput>False</CaptureConsoleOutput>
    <StartMode>Project</StartMode>
    <RegisterForComInterop>False</RegisterForComInterop>
    <CpuType>anycpu</CpuType>
    <RuntimeVersion>v25</RuntimeVersion>
    <XmlDoc>False</XmlDoc>
    <XmlDocWarningLevel>WarningOnPublicMembers</XmlDocWarningLevel>
    <EnableUnmanagedDebugging>False</EnableUnmanagedDebugging>
    <WarnOnCaseMismatch>True</WarnOnCaseMismatch>
  </PropertyGroup>
  <ItemGroup>
    <Reference Include="Common.Logging">
      <HintPath>..\packages\Common.Logging.2.2.0\lib\net40\Common.Logging.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="Common.Logging.Core">
      <HintPath>..\packages\Common.Logging.Core.2.2.0\lib\net40\Common.Logging.Core.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="Dapper">
      <HintPath>..\packages\Dapper.1.13\lib\net45\Dapper.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="HangFire.Azure.ServiceBusQueue">
      <HintPath>..\packages\HangFire.Azure.ServiceBusQueue.0.0.1\lib\net45\HangFire.Azure.ServiceBusQueue.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="Hangfire.Core">
      <HintPath>..\packages\Hangfire.Core.1.1.1\lib\net45\Hangfire.Core.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="Hangfire.SqlServer">
      <HintPath>..\packages\Hangfire.SqlServer.1.1.1\lib\net45\Hangfire.SqlServer.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="Microsoft.CSharp" />
    <Reference Include="Microsoft.Owin">
      <HintPath>..\packages\Microsoft.Owin.3.0.0\lib\net45\Microsoft.Owin.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="Microsoft.Owin.Host.HttpListener">
      <HintPath>..\packages\Microsoft.Owin.Host.HttpListener.3.0.0\lib\net45\Microsoft.Owin.Host.HttpListener.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="Microsoft.Owin.Hosting">
      <HintPath>..\packages\Microsoft.Owin.Hosting.3.0.0\lib\net45\Microsoft.Owin.Hosting.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="Microsoft.ServiceBus">
      <HintPath>..\packages\WindowsAzure.ServiceBus.2.3.4.0\lib\net40-full\Microsoft.ServiceBus.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="Microsoft.WindowsAzure.Configuration">
      <HintPath>..\packages\Microsoft.WindowsAzure.ConfigurationManager.2.0.3\lib\net40\Microsoft.WindowsAzure.Configuration.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="mscorlib" />
    <Reference Include="Nancy">
      <HintPath>..\packages\Nancy.0.23.2\lib\net40\Nancy.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="Nancy.Owin">
      <HintPath>..\packages\Nancy.Owin.0.23.2\lib\net40\Nancy.Owin.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="Newtonsoft.Json">
      <HintPath>..\packages\Newtonsoft.Json.5.0.8\lib\net45\Newtonsoft.Json.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="Owin">
      <HintPath>..\packages\Owin.1.0\lib\net40\Owin.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="System" />
    <Reference Include="System.Configuration">
      <HintPath>C:\Program Files\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.5\System.Configuration.dll</HintPath>
    </Reference>
    <Reference Include="System.Data" />
    <Reference Include="System.Runtime.Serialization" />
    <Reference Include="System.ServiceModel" />
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
    <Compile Include="Module\SomeModule.pas" />
    <Compile Include="Program.pas" />
    <Compile Include="Properties\AssemblyInfo.pas" />
    <Compile Include="Startup.pas" />
    <Content Include="app.config">
      <SubType>Content</SubType>
    </Content>
    <Content Include="packages.config">
      <SubType>Content</SubType>
    </Content>
    <Content Include="Performance\Microsoft.ServiceBus.MessagingPerformanceCounters.man">
      <SubType>Content</SubType>
    </Content>
    <Content Include="Properties\App.ico" />
    <EmbeddedResource Include="Properties\Resources.resx">
      <Generator>ResXFileCodeGenerator</Generator>
    </EmbeddedResource>
    <Compile Include="Properties\Resources.Designer.pas" />
    <None Include="Properties\Settings.settings">
      <Generator>SettingsSingleFileGenerator</Generator>
    </None>
    <Compile Include="Properties\Settings.Designer.pas" />
  </ItemGroup>
  <ItemGroup>
    <Folder Include="Module" />
    <Folder Include="Performance\" />
    <Folder Include="Properties\" />
  </ItemGroup>
  <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Oxygene\RemObjects.Oxygene.Echoes.targets" />
</Project>