
fn main {
	let count = 0;
	vkEnumerateInstanceExtensionProperties(nil, &count, nil);
	printf("Count %d %lu\n", count, sizeof[ExtensionProperties]());
	let props = alloc[ExtensionProperties](:long count);
	printf("Malloc fine %lu\n", :long count * sizeof[ExtensionProperties]());
	vkEnumerateInstanceExtensionProperties(nil, &count, props);
}

fn sizeof[Ty] -> long {

}


fn gfree[T](ptr *T) {
	free(:*[] ptr);
}

fn alloc[T](len long) -> *T {
	ret :*T malloc(len * sizeof[T]());
}

extern {
  printf(str, ...)
	malloc(long) -> *[]
	free(*[])
  vkCreateInstance(*InstanceCreateInfo, *byte , *Instance) -> int
  vkEnumerateInstanceExtensionProperties(*byte, *int, *ExtensionProperties) -> int
  vkEnumeratePhysicalDevices(Instance, *int, *PhysicalDevice) -> int
  vkCreateDevice(PhysicalDevice, *DeviceCreateInfo, *byte , *Device) -> int
  vkGetPhysicalDeviceQueueFamilyProperties(PhysicalDevice, *int, *byte )
  vkEnumerateDeviceExtensionProperties(PhysicalDevice, *byte , *int, *ExtensionProperties) -> int
}

type Bool32 {
  handle int
}

type Instance {
  handle long
}

type Device {
  handle long
}

type StructureType {
  handle long
}

type DeviceCreateFlags {
  handle long
}

type InstanceCreateFlags {
  handle long
}

type DeviceQueueCreateFlags {
  handle long
}

type PhysicalDevice {
  handle long
}

type ApplicationInfo {
	sType StructureType
	pNext *[]
	pApplicationName *byte
	applicationVersion int
	pEngineName *byte
	engineVersion int
	apiVersion int
	apiVersion int
}

type InstanceCreateInfo {
	sType StructureType
	pNext *[]
	flags InstanceCreateFlags
	pApplicationInfo *ApplicationInfo
	enabledLayerCount int
	ppEnabledLayerNames **byte
	enabledExtensionCount int
	ppEnabledExtensionNames **byte
	ppEnabledExtensionNames **byte
}

type ExtensionProperties {
	extensionName byte
	specVersion int
	specVersion int
}

type DeviceCreateInfo {
	sType StructureType
	pNext *[]
	flags DeviceCreateFlags
	queueCreateInfoCount int
	pQueueCreateInfos *DeviceQueueCreateInfo
	enabledLayerCount int
	ppEnabledLayerNames **byte
	enabledExtensionCount int
	ppEnabledExtensionNames **byte
	pEnabledFeatures *PhysicalDeviceFeatures
	pEnabledFeatures *PhysicalDeviceFeatures
}


type DeviceQueueCreateInfo {
	sType StructureType
	pNext *[]
	flags DeviceQueueCreateFlags
	queueFamilyIndex int
	queueCount int
	pQueuePriorities *real
	pQueuePriorities *real
}

type PhysicalDeviceFeatures {
	robustBufferAccess Bool32
	fullDrawIndexUint32 Bool32
	imageCubeArray Bool32
	independentBlend Bool32
	geometryShader Bool32
	tessellationShader Bool32
	sampleRateShading Bool32
	dualSrcBlend Bool32
	logicOp Bool32
	multiDrawIndirect Bool32
	drawIndirectFirstInstance Bool32
	depthClamp Bool32
	depthBiasClamp Bool32
	fillModeNonSolid Bool32
	depthBounds Bool32
	wideLines Bool32
	largePoints Bool32
	alphaToOne Bool32
	multiViewport Bool32
	samplerAnisotropy Bool32
	textureCompressionETC2 Bool32
	textureCompressionASTC_LDR Bool32
	textureCompressionBC Bool32
	occlusionQueryPrecise Bool32
	pipelineStatisticsQuery Bool32
	vertexPipelineStoresAndAtomics Bool32
	fragmentStoresAndAtomics Bool32
	shaderTessellationAndGeometryPointSize Bool32
	shaderImageGatherExtended Bool32
	shaderStorageImageExtendedFormats Bool32
	shaderStorageImageMultisample Bool32
	shaderStorageImageReadWithoutFormat Bool32
	shaderStorageImageWriteWithoutFormat Bool32
	shaderUniformBufferArrayDynamicIndexing Bool32
	shaderSampledImageArrayDynamicIndexing Bool32
	shaderStorageBufferArrayDynamicIndexing Bool32
	shaderStorageImageArrayDynamicIndexing Bool32
	shaderClipDistance Bool32
	shaderCullDistance Bool32
	shaderFloat64 Bool32
	shaderInt64 Bool32
	shaderInt16 Bool32
	shaderResourceResidency Bool32
	shaderResourceMinLod Bool32
	sparseBinding Bool32
	sparseResidencyBuffer Bool32
	sparseResidencyImage2D Bool32
	sparseResidencyImage3D Bool32
	sparseResidency2Samples Bool32
	sparseResidency4Samples Bool32
	sparseResidency8Samples Bool32
	sparseResidency16Samples Bool32
	sparseResidencyAliased Bool32
	variableMultisampleRate Bool32
	inheritedQueries Bool32
	inheritedQueries Bool32
}