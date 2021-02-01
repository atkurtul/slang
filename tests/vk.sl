type ApplicationInfo {
	sType StructureType,
	pNext *[],
	pApplicationName *byte,
	applicationVersion int,
	pEngineName *byte,
	engineVersion int,
	apiVersion int,
	apiVersion int,
}

type InstanceCreateInfo {
	sType StructureType,
	pNext *[],
	flags InstanceCreateFlags,
	pApplicationInfo *ApplicationInfo,
	enabledLayerCount int,
	ppEnabledLayerNames **byte,
	enabledExtensionCount int,
	ppEnabledExtensionNames **byte,
	ppEnabledExtensionNames **byte,
}

type AllocationCallbacks {
	pUserData *[],
	pfnAllocation PFNAllocationFunction,
	pfnReallocation PFNReallocationFunction,
	pfnFree PFNFreeFunction,
	pfnInternalAllocation PFNInternalAllocationNotification,
	pfnInternalFree PFNInternalFreeNotification,
	pfnInternalFree PFNInternalFreeNotification,
}

type PhysicalDeviceFeatures {
	robustBufferAccess Bool32,
	fullDrawIndexUint32 Bool32,
	imageCubeArray Bool32,
	independentBlend Bool32,
	geometryShader Bool32,
	tessellationShader Bool32,
	sampleRateShading Bool32,
	dualSrcBlend Bool32,
	logicOp Bool32,
	multiDrawIndirect Bool32,
	drawIndirectFirstInstance Bool32,
	depthClamp Bool32,
	depthBiasClamp Bool32,
	fillModeNonSolid Bool32,
	depthBounds Bool32,
	wideLines Bool32,
	largePoints Bool32,
	alphaToOne Bool32,
	multiViewport Bool32,
	samplerAnisotropy Bool32,
	textureCompressionETC2 Bool32,
	textureCompressionASTC_LDR Bool32,
	textureCompressionBC Bool32,
	occlusionQueryPrecise Bool32,
	pipelineStatisticsQuery Bool32,
	vertexPipelineStoresAndAtomics Bool32,
	fragmentStoresAndAtomics Bool32,
	shaderTessellationAndGeometryPointSize Bool32,
	shaderImageGatherExtended Bool32,
	shaderStorageImageExtendedFormats Bool32,
	shaderStorageImageMultisample Bool32,
	shaderStorageImageReadWithoutFormat Bool32,
	shaderStorageImageWriteWithoutFormat Bool32,
	shaderUniformBufferArrayDynamicIndexing Bool32,
	shaderSampledImageArrayDynamicIndexing Bool32,
	shaderStorageBufferArrayDynamicIndexing Bool32,
	shaderStorageImageArrayDynamicIndexing Bool32,
	shaderClipDistance Bool32,
	shaderCullDistance Bool32,
	shaderFloat64 Bool32,
	shaderInt64 Bool32,
	shaderInt16 Bool32,
	shaderResourceResidency Bool32,
	shaderResourceMinLod Bool32,
	sparseBinding Bool32,
	sparseResidencyBuffer Bool32,
	sparseResidencyImage2D Bool32,
	sparseResidencyImage3D Bool32,
	sparseResidency2Samples Bool32,
	sparseResidency4Samples Bool32,
	sparseResidency8Samples Bool32,
	sparseResidency16Samples Bool32,
	sparseResidencyAliased Bool32,
	variableMultisampleRate Bool32,
	inheritedQueries Bool32,
	inheritedQueries Bool32,
}

type FormatProperties {
	linearTilingFeatures FormatFeatureFlags,
	optimalTilingFeatures FormatFeatureFlags,
	bufferFeatures FormatFeatureFlags,
	bufferFeatures FormatFeatureFlags,
}

type Extent3D {
	width int,
	height int,
	depth int,
	depth int,
}

type ImageFormatProperties {
	maxExtent Extent3D,
	maxMipLevels int,
	maxArrayLayers int,
	sampleCounts SampleCountFlags,
	maxResourceSize DeviceSize,
	maxResourceSize DeviceSize,
}

type PhysicalDeviceLimits {
	maxImageDimension1D int,
	maxImageDimension2D int,
	maxImageDimension3D int,
	maxImageDimensionCube int,
	maxImageArrayLayers int,
	maxTexelBufferElements int,
	maxUniformBufferRange int,
	maxStorageBufferRange int,
	maxPushConstantsSize int,
	maxMemoryAllocationCount int,
	maxSamplerAllocationCount int,
	bufferImageGranularity DeviceSize,
	sparseAddressSpaceSize DeviceSize,
	maxBoundDescriptorSets int,
	maxPerStageDescriptorSamplers int,
	maxPerStageDescriptorUniformBuffers int,
	maxPerStageDescriptorStorageBuffers int,
	maxPerStageDescriptorSampledImages int,
	maxPerStageDescriptorStorageImages int,
	maxPerStageDescriptorInputAttachments int,
	maxPerStageResources int,
	maxDescriptorSetSamplers int,
	maxDescriptorSetUniformBuffers int,
	maxDescriptorSetUniformBuffersDynamic int,
	maxDescriptorSetStorageBuffers int,
	maxDescriptorSetStorageBuffersDynamic int,
	maxDescriptorSetSampledImages int,
	maxDescriptorSetStorageImages int,
	maxDescriptorSetInputAttachments int,
	maxVertexInputAttributes int,
	maxVertexInputBindings int,
	maxVertexInputAttributeOffset int,
	maxVertexInputBindingStride int,
	maxVertexOutputComponents int,
	maxTessellationGenerationLevel int,
	maxTessellationPatchSize int,
	maxTessellationControlPerVertexInputComponents int,
	maxTessellationControlPerVertexOutputComponents int,
	maxTessellationControlPerPatchOutputComponents int,
	maxTessellationControlTotalOutputComponents int,
	maxTessellationEvaluationInputComponents int,
	maxTessellationEvaluationOutputComponents int,
	maxGeometryShaderInvocations int,
	maxGeometryInputComponents int,
	maxGeometryOutputComponents int,
	maxGeometryOutputVertices int,
	maxGeometryTotalOutputComponents int,
	maxFragmentInputComponents int,
	maxFragmentOutputAttachments int,
	maxFragmentDualSrcAttachments int,
	maxFragmentCombinedOutputResources int,
	maxComputeSharedMemorySize int,
	maxComputeWorkGroupCount int,
	maxComputeWorkGroupInvocations int,
	maxComputeWorkGroupSize int,
	subPixelPrecisionBits int,
	subTexelPrecisionBits int,
	mipmapPrecisionBits int,
	maxDrawIndexedIndexValue int,
	maxDrawIndirectCount int,
	maxSamplerLodBias real,
	maxSamplerAnisotropy real,
	maxViewports int,
	maxViewportDimensions int,
	viewportBoundsRange real,
	viewportSubPixelBits int,
	minMemoryMapAlignment size_t,
	minTexelBufferOffsetAlignment DeviceSize,
	minUniformBufferOffsetAlignment DeviceSize,
	minStorageBufferOffsetAlignment DeviceSize,
	minTexelOffset int32_t,
	maxTexelOffset int,
	minTexelGatherOffset int32_t,
	maxTexelGatherOffset int,
	minInterpolationOffset real,
	maxInterpolationOffset real,
	subPixelInterpolationOffsetBits int,
	maxFramebufferWidth int,
	maxFramebufferHeight int,
	maxFramebufferLayers int,
	framebufferColorSampleCounts SampleCountFlags,
	framebufferDepthSampleCounts SampleCountFlags,
	framebufferStencilSampleCounts SampleCountFlags,
	framebufferNoAttachmentsSampleCounts SampleCountFlags,
	maxColorAttachments int,
	sampledImageColorSampleCounts SampleCountFlags,
	sampledImageIntegerSampleCounts SampleCountFlags,
	sampledImageDepthSampleCounts SampleCountFlags,
	sampledImageStencilSampleCounts SampleCountFlags,
	storageImageSampleCounts SampleCountFlags,
	maxSampleMaskWords int,
	timestampComputeAndGraphics Bool32,
	timestampPeriod real,
	maxClipDistances int,
	maxCullDistances int,
	maxCombinedClipAndCullDistances int,
	discreteQueuePriorities int,
	pointSizeRange real,
	lineWidthRange real,
	pointSizeGranularity real,
	lineWidthGranularity real,
	strictLines Bool32,
	standardSampleLocations Bool32,
	optimalBufferCopyOffsetAlignment DeviceSize,
	optimalBufferCopyRowPitchAlignment DeviceSize,
	nonCoherentAtomSize DeviceSize,
	nonCoherentAtomSize DeviceSize,
}

type PhysicalDeviceSparseProperties {
	residencyStandard2DBlockShape Bool32,
	residencyStandard2DMultisampleBlockShape Bool32,
	residencyStandard3DBlockShape Bool32,
	residencyAlignedMipSize Bool32,
	residencyNonResidentStrict Bool32,
	residencyNonResidentStrict Bool32,
}

type PhysicalDeviceProperties {
	apiVersion int,
	driverVersion int,
	vendorID int,
	deviceID int,
	deviceType PhysicalDeviceType,
	deviceName byte,
	pipelineCacheUUID uint8_t,
	limits PhysicalDeviceLimits,
	sparseProperties PhysicalDeviceSparseProperties,
	sparseProperties PhysicalDeviceSparseProperties,
}

type QueueFamilyProperties {
	queueFlags QueueFlags,
	queueCount int,
	timestampValidBits int,
	minImageTransferGranularity Extent3D,
	minImageTransferGranularity Extent3D,
}

type MemoryType {
	propertyFlags MemoryPropertyFlags,
	heapIndex int,
	heapIndex int,
}

type MemoryHeap {
	size DeviceSize,
	flags MemoryHeapFlags,
	flags MemoryHeapFlags,
}

type PhysicalDeviceMemoryProperties {
	memoryTypeCount int,
	memoryTypes MemoryType,
	memoryHeapCount int,
	memoryHeaps MemoryHeap,
	memoryHeaps MemoryHeap,
}

type DeviceQueueCreateInfo {
	sType StructureType,
	pNext *[],
	flags DeviceQueueCreateFlags,
	queueFamilyIndex int,
	queueCount int,
	pQueuePriorities *real,
	pQueuePriorities *real,
}

type DeviceCreateInfo {
	sType StructureType,
	pNext *[],
	flags DeviceCreateFlags,
	queueCreateInfoCount int,
	pQueueCreateInfos *DeviceQueueCreateInfo,
	enabledLayerCount int,
	ppEnabledLayerNames **byte,
	enabledExtensionCount int,
	ppEnabledExtensionNames **byte,
	pEnabledFeatures *PhysicalDeviceFeatures,
	pEnabledFeatures *PhysicalDeviceFeatures,
}

type ExtensionProperties {
	extensionName byte,
	specVersion int,
	specVersion int,
}

type LayerProperties {
	layerName byte,
	specVersion int,
	implementationVersion int,
	description byte,
	description byte,
}

type SubmitInfo {
	sType StructureType,
	pNext *[],
	waitSemaphoreCount int,
	pWaitSemaphores *Semaphore,
	pWaitDstStageMask *PipelineStageFlags,
	commandBufferCount int,
	pCommandBuffers *CommandBuffer,
	signalSemaphoreCount int,
	pSignalSemaphores *Semaphore,
	pSignalSemaphores *Semaphore,
}

type MemoryAllocateInfo {
	sType StructureType,
	pNext *[],
	allocationSize DeviceSize,
	memoryTypeIndex int,
	memoryTypeIndex int,
}

type MappedMemoryRange {
	sType StructureType,
	pNext *[],
	memory DeviceMemory,
	offset DeviceSize,
	size DeviceSize,
	size DeviceSize,
}

type MemoryRequirements {
	size DeviceSize,
	alignment DeviceSize,
	memoryTypeBits int,
	memoryTypeBits int,
}

type SparseImageFormatProperties {
	aspectMask ImageAspectFlags,
	imageGranularity Extent3D,
	flags SparseImageFormatFlags,
	flags SparseImageFormatFlags,
}

type SparseImageMemoryRequirements {
	formatProperties SparseImageFormatProperties,
	imageMipTailFirstLod int,
	imageMipTailSize DeviceSize,
	imageMipTailOffset DeviceSize,
	imageMipTailStride DeviceSize,
	imageMipTailStride DeviceSize,
}

type SparseMemoryBind {
	resourceOffset DeviceSize,
	size DeviceSize,
	memory DeviceMemory,
	memoryOffset DeviceSize,
	flags SparseMemoryBindFlags,
	flags SparseMemoryBindFlags,
}

type SparseBufferMemoryBindInfo {
	buffer Buffer,
	bindCount int,
	pBinds *SparseMemoryBind,
	pBinds *SparseMemoryBind,
}

type SparseImageOpaqueMemoryBindInfo {
	image Image,
	bindCount int,
	pBinds *SparseMemoryBind,
	pBinds *SparseMemoryBind,
}

type ImageSubresource {
	aspectMask ImageAspectFlags,
	mipLevel int,
	arrayLayer int,
	arrayLayer int,
}

type Offset3D {
	x int32_t,
	y int32_t,
	z int32_t,
	z int32_t,
}

type SparseImageMemoryBind {
	subresource ImageSubresource,
	offset Offset3D,
	extent Extent3D,
	memory DeviceMemory,
	memoryOffset DeviceSize,
	flags SparseMemoryBindFlags,
	flags SparseMemoryBindFlags,
}

type SparseImageMemoryBindInfo {
	image Image,
	bindCount int,
	pBinds *SparseImageMemoryBind,
	pBinds *SparseImageMemoryBind,
}

type BindSparseInfo {
	sType StructureType,
	pNext *[],
	waitSemaphoreCount int,
	pWaitSemaphores *Semaphore,
	bufferBindCount int,
	pBufferBinds *SparseBufferMemoryBindInfo,
	imageOpaqueBindCount int,
	pImageOpaqueBinds *SparseImageOpaqueMemoryBindInfo,
	imageBindCount int,
	pImageBinds *SparseImageMemoryBindInfo,
	signalSemaphoreCount int,
	pSignalSemaphores *Semaphore,
	pSignalSemaphores *Semaphore,
}

type FenceCreateInfo {
	sType StructureType,
	pNext *[],
	flags FenceCreateFlags,
	flags FenceCreateFlags,
}

type SemaphoreCreateInfo {
	sType StructureType,
	pNext *[],
	flags SemaphoreCreateFlags,
	flags SemaphoreCreateFlags,
}

type EventCreateInfo {
	sType StructureType,
	pNext *[],
	flags EventCreateFlags,
	flags EventCreateFlags,
}

type QueryPoolCreateInfo {
	sType StructureType,
	pNext *[],
	flags QueryPoolCreateFlags,
	queryType QueryType,
	queryCount int,
	pipelineStatistics QueryPipelineStatisticFlags,
	pipelineStatistics QueryPipelineStatisticFlags,
}

type BufferCreateInfo {
	sType StructureType,
	pNext *[],
	flags BufferCreateFlags,
	size DeviceSize,
	usage BufferUsageFlags,
	sharingMode SharingMode,
	queueFamilyIndexCount int,
	pQueueFamilyIndices *int,
	pQueueFamilyIndices *int,
}

type BufferViewCreateInfo {
	sType StructureType,
	pNext *[],
	flags BufferViewCreateFlags,
	buffer Buffer,
	format Format,
	offset DeviceSize,
	range DeviceSize,
	range DeviceSize,
}

type ImageCreateInfo {
	sType StructureType,
	pNext *[],
	flags ImageCreateFlags,
	imageType ImageType,
	format Format,
	extent Extent3D,
	mipLevels int,
	arrayLayers int,
	samples SampleCountFlagBits,
	tiling ImageTiling,
	usage ImageUsageFlags,
	sharingMode SharingMode,
	queueFamilyIndexCount int,
	pQueueFamilyIndices *int,
	initialLayout ImageLayout,
	initialLayout ImageLayout,
}

type SubresourceLayout {
	offset DeviceSize,
	size DeviceSize,
	rowPitch DeviceSize,
	arrayPitch DeviceSize,
	depthPitch DeviceSize,
	depthPitch DeviceSize,
}

type ComponentMapping {
	r ComponentSwizzle,
	g ComponentSwizzle,
	b ComponentSwizzle,
	a ComponentSwizzle,
	a ComponentSwizzle,
}

type ImageSubresourceRange {
	aspectMask ImageAspectFlags,
	baseMipLevel int,
	levelCount int,
	baseArrayLayer int,
	layerCount int,
	layerCount int,
}

type ImageViewCreateInfo {
	sType StructureType,
	pNext *[],
	flags ImageViewCreateFlags,
	image Image,
	viewType ImageViewType,
	format Format,
	components ComponentMapping,
	subresourceRange ImageSubresourceRange,
	subresourceRange ImageSubresourceRange,
}

type ShaderModuleCreateInfo {
	sType StructureType,
	pNext *[],
	flags ShaderModuleCreateFlags,
	codeSize size_t,
	pCode *int,
	pCode *int,
}

type PipelineCacheCreateInfo {
	sType StructureType,
	pNext *[],
	flags PipelineCacheCreateFlags,
	initialDataSize size_t,
	pInitialData *[],
	pInitialData *[],
}

type SpecializationMapEntry {
	constantID int,
	offset int,
	size size_t,
	size size_t,
}

type SpecializationInfo {
	mapEntryCount int,
	pMapEntries *SpecializationMapEntry,
	dataSize size_t,
	pData *[],
	pData *[],
}

type PipelineShaderStageCreateInfo {
	sType StructureType,
	pNext *[],
	flags PipelineShaderStageCreateFlags,
	stage ShaderStageFlagBits,
	module ShaderModule,
	pName *byte,
	pSpecializationInfo *SpecializationInfo,
	pSpecializationInfo *SpecializationInfo,
}

type VertexInputBindingDescription {
	binding int,
	stride int,
	inputRate VertexInputRate,
	inputRate VertexInputRate,
}

type VertexInputAttributeDescription {
	location int,
	binding int,
	format Format,
	offset int,
	offset int,
}

type PipelineVertexInputStateCreateInfo {
	sType StructureType,
	pNext *[],
	flags PipelineVertexInputStateCreateFlags,
	vertexBindingDescriptionCount int,
	pVertexBindingDescriptions *VertexInputBindingDescription,
	vertexAttributeDescriptionCount int,
	pVertexAttributeDescriptions *VertexInputAttributeDescription,
	pVertexAttributeDescriptions *VertexInputAttributeDescription,
}

type PipelineInputAssemblyStateCreateInfo {
	sType StructureType,
	pNext *[],
	flags PipelineInputAssemblyStateCreateFlags,
	topology PrimitiveTopology,
	primitiveRestartEnable Bool32,
	primitiveRestartEnable Bool32,
}

type PipelineTessellationStateCreateInfo {
	sType StructureType,
	pNext *[],
	flags PipelineTessellationStateCreateFlags,
	patchControlPoints int,
	patchControlPoints int,
}

type Viewport {
	x real,
	y real,
	width real,
	height real,
	minDepth real,
	maxDepth real,
	maxDepth real,
}

type Offset2D {
	x int32_t,
	y int32_t,
	y int32_t,
}

type Extent2D {
	width int,
	height int,
	height int,
}

type Rect2D {
	offset Offset2D,
	extent Extent2D,
	extent Extent2D,
}

type PipelineViewportStateCreateInfo {
	sType StructureType,
	pNext *[],
	flags PipelineViewportStateCreateFlags,
	viewportCount int,
	pViewports *Viewport,
	scissorCount int,
	pScissors *Rect2D,
	pScissors *Rect2D,
}

type PipelineRasterizationStateCreateInfo {
	sType StructureType,
	pNext *[],
	flags PipelineRasterizationStateCreateFlags,
	depthClampEnable Bool32,
	rasterizerDiscardEnable Bool32,
	polygonMode PolygonMode,
	cullMode CullModeFlags,
	frontFace FrontFace,
	depthBiasEnable Bool32,
	depthBiasConstantFactor real,
	depthBiasClamp real,
	depthBiasSlopeFactor real,
	lineWidth real,
	lineWidth real,
}

type PipelineMultisampleStateCreateInfo {
	sType StructureType,
	pNext *[],
	flags PipelineMultisampleStateCreateFlags,
	rasterizationSamples SampleCountFlagBits,
	sampleShadingEnable Bool32,
	minSampleShading real,
	pSampleMask *SampleMask,
	alphaToCoverageEnable Bool32,
	alphaToOneEnable Bool32,
	alphaToOneEnable Bool32,
}

type StencilOpState {
	failOp StencilOp,
	passOp StencilOp,
	depthFailOp StencilOp,
	compareOp CompareOp,
	compareMask int,
	writeMask int,
	reference int,
	reference int,
}

type PipelineDepthStencilStateCreateInfo {
	sType StructureType,
	pNext *[],
	flags PipelineDepthStencilStateCreateFlags,
	depthTestEnable Bool32,
	depthWriteEnable Bool32,
	depthCompareOp CompareOp,
	depthBoundsTestEnable Bool32,
	stencilTestEnable Bool32,
	front StencilOpState,
	back StencilOpState,
	minDepthBounds real,
	maxDepthBounds real,
	maxDepthBounds real,
}

type PipelineColorBlendAttachmentState {
	blendEnable Bool32,
	srcColorBlendFactor BlendFactor,
	dstColorBlendFactor BlendFactor,
	colorBlendOp BlendOp,
	srcAlphaBlendFactor BlendFactor,
	dstAlphaBlendFactor BlendFactor,
	alphaBlendOp BlendOp,
	colorWriteMask ColorComponentFlags,
	colorWriteMask ColorComponentFlags,
}

type PipelineColorBlendStateCreateInfo {
	sType StructureType,
	pNext *[],
	flags PipelineColorBlendStateCreateFlags,
	logicOpEnable Bool32,
	logicOp LogicOp,
	attachmentCount int,
	pAttachments *PipelineColorBlendAttachmentState,
	blendConstants real,
	blendConstants real,
}

type PipelineDynamicStateCreateInfo {
	sType StructureType,
	pNext *[],
	flags PipelineDynamicStateCreateFlags,
	dynamicStateCount int,
	pDynamicStates *DynamicState,
	pDynamicStates *DynamicState,
}

type GraphicsPipelineCreateInfo {
	sType StructureType,
	pNext *[],
	flags PipelineCreateFlags,
	stageCount int,
	pStages *PipelineShaderStageCreateInfo,
	pVertexInputState *PipelineVertexInputStateCreateInfo,
	pInputAssemblyState *PipelineInputAssemblyStateCreateInfo,
	pTessellationState *PipelineTessellationStateCreateInfo,
	pViewportState *PipelineViewportStateCreateInfo,
	pRasterizationState *PipelineRasterizationStateCreateInfo,
	pMultisampleState *PipelineMultisampleStateCreateInfo,
	pDepthStencilState *PipelineDepthStencilStateCreateInfo,
	pColorBlendState *PipelineColorBlendStateCreateInfo,
	pDynamicState *PipelineDynamicStateCreateInfo,
	layout PipelineLayout,
	renderPass RenderPass,
	subpass int,
	basePipelineHandle Pipeline,
	basePipelineIndex int32_t,
	basePipelineIndex int32_t,
}

type ComputePipelineCreateInfo {
	sType StructureType,
	pNext *[],
	flags PipelineCreateFlags,
	stage PipelineShaderStageCreateInfo,
	layout PipelineLayout,
	basePipelineHandle Pipeline,
	basePipelineIndex int32_t,
	basePipelineIndex int32_t,
}

type PushConstantRange {
	stageFlags ShaderStageFlags,
	offset int,
	size int,
	size int,
}

type PipelineLayoutCreateInfo {
	sType StructureType,
	pNext *[],
	flags PipelineLayoutCreateFlags,
	setLayoutCount int,
	pSetLayouts *DescriptorSetLayout,
	pushConstantRangeCount int,
	pPushConstantRanges *PushConstantRange,
	pPushConstantRanges *PushConstantRange,
}

type SamplerCreateInfo {
	sType StructureType,
	pNext *[],
	flags SamplerCreateFlags,
	magFilter Filter,
	minFilter Filter,
	mipmapMode SamplerMipmapMode,
	addressModeU SamplerAddressMode,
	addressModeV SamplerAddressMode,
	addressModeW SamplerAddressMode,
	mipLodBias real,
	anisotropyEnable Bool32,
	maxAnisotropy real,
	compareEnable Bool32,
	compareOp CompareOp,
	minLod real,
	maxLod real,
	borderColor BorderColor,
	unnormalizedCoordinates Bool32,
	unnormalizedCoordinates Bool32,
}

type DescriptorSetLayoutBinding {
	binding int,
	descriptorType DescriptorType,
	descriptorCount int,
	stageFlags ShaderStageFlags,
	pImmutableSamplers *Sampler,
	pImmutableSamplers *Sampler,
}

type DescriptorSetLayoutCreateInfo {
	sType StructureType,
	pNext *[],
	flags DescriptorSetLayoutCreateFlags,
	bindingCount int,
	pBindings *DescriptorSetLayoutBinding,
	pBindings *DescriptorSetLayoutBinding,
}

type DescriptorPoolSize {
	ty DescriptorType,
	descriptorCount int,
	descriptorCount int,
}

type DescriptorPoolCreateInfo {
	sType StructureType,
	pNext *[],
	flags DescriptorPoolCreateFlags,
	maxSets int,
	poolSizeCount int,
	pPoolSizes *DescriptorPoolSize,
	pPoolSizes *DescriptorPoolSize,
}

type DescriptorSetAllocateInfo {
	sType StructureType,
	pNext *[],
	descriptorPool DescriptorPool,
	descriptorSetCount int,
	pSetLayouts *DescriptorSetLayout,
	pSetLayouts *DescriptorSetLayout,
}

type DescriptorImageInfo {
	sampler Sampler,
	imageView ImageView,
	imageLayout ImageLayout,
	imageLayout ImageLayout,
}

type DescriptorBufferInfo {
	buffer Buffer,
	offset DeviceSize,
	range DeviceSize,
	range DeviceSize,
}

type WriteDescriptorSet {
	sType StructureType,
	pNext *[],
	dstSet DescriptorSet,
	dstBinding int,
	dstArrayElement int,
	descriptorCount int,
	descriptorType DescriptorType,
	pImageInfo *DescriptorImageInfo,
	pBufferInfo *DescriptorBufferInfo,
	pTexelBufferView *BufferView,
	pTexelBufferView *BufferView,
}

type CopyDescriptorSet {
	sType StructureType,
	pNext *[],
	srcSet DescriptorSet,
	srcBinding int,
	srcArrayElement int,
	dstSet DescriptorSet,
	dstBinding int,
	dstArrayElement int,
	descriptorCount int,
	descriptorCount int,
}

type FramebufferCreateInfo {
	sType StructureType,
	pNext *[],
	flags FramebufferCreateFlags,
	renderPass RenderPass,
	attachmentCount int,
	pAttachments *ImageView,
	width int,
	height int,
	layers int,
	layers int,
}

type AttachmentDescription {
	flags AttachmentDescriptionFlags,
	format Format,
	samples SampleCountFlagBits,
	loadOp AttachmentLoadOp,
	storeOp AttachmentStoreOp,
	stencilLoadOp AttachmentLoadOp,
	stencilStoreOp AttachmentStoreOp,
	initialLayout ImageLayout,
	finalLayout ImageLayout,
	finalLayout ImageLayout,
}

type AttachmentReference {
	attachment int,
	layout ImageLayout,
	layout ImageLayout,
}

type SubpassDescription {
	flags SubpassDescriptionFlags,
	pipelineBindPoint PipelineBindPoint,
	inputAttachmentCount int,
	pInputAttachments *AttachmentReference,
	colorAttachmentCount int,
	pColorAttachments *AttachmentReference,
	pResolveAttachments *AttachmentReference,
	pDepthStencilAttachment *AttachmentReference,
	preserveAttachmentCount int,
	pPreserveAttachments *int,
	pPreserveAttachments *int,
}

type SubpassDependency {
	srcSubpass int,
	dstSubpass int,
	srcStageMask PipelineStageFlags,
	dstStageMask PipelineStageFlags,
	srcAccessMask AccessFlags,
	dstAccessMask AccessFlags,
	dependencyFlags DependencyFlags,
	dependencyFlags DependencyFlags,
}

type RenderPassCreateInfo {
	sType StructureType,
	pNext *[],
	flags RenderPassCreateFlags,
	attachmentCount int,
	pAttachments *AttachmentDescription,
	subpassCount int,
	pSubpasses *SubpassDescription,
	dependencyCount int,
	pDependencies *SubpassDependency,
	pDependencies *SubpassDependency,
}

type CommandPoolCreateInfo {
	sType StructureType,
	pNext *[],
	flags CommandPoolCreateFlags,
	queueFamilyIndex int,
	queueFamilyIndex int,
}

type CommandBufferAllocateInfo {
	sType StructureType,
	pNext *[],
	commandPool CommandPool,
	level CommandBufferLevel,
	commandBufferCount int,
	commandBufferCount int,
}

type CommandBufferInheritanceInfo {
	sType StructureType,
	pNext *[],
	renderPass RenderPass,
	subpass int,
	framebuffer Framebuffer,
	occlusionQueryEnable Bool32,
	queryFlags QueryControlFlags,
	pipelineStatistics QueryPipelineStatisticFlags,
	pipelineStatistics QueryPipelineStatisticFlags,
}

type CommandBufferBeginInfo {
	sType StructureType,
	pNext *[],
	flags CommandBufferUsageFlags,
	pInheritanceInfo *CommandBufferInheritanceInfo,
	pInheritanceInfo *CommandBufferInheritanceInfo,
}

type BufferCopy {
	srcOffset DeviceSize,
	dstOffset DeviceSize,
	size DeviceSize,
	size DeviceSize,
}

type ImageSubresourceLayers {
	aspectMask ImageAspectFlags,
	mipLevel int,
	baseArrayLayer int,
	layerCount int,
	layerCount int,
}

type ImageCopy {
	srcSubresource ImageSubresourceLayers,
	srcOffset Offset3D,
	dstSubresource ImageSubresourceLayers,
	dstOffset Offset3D,
	extent Extent3D,
	extent Extent3D,
}

type ImageBlit {
	srcSubresource ImageSubresourceLayers,
	srcOffsets Offset3D,
	dstSubresource ImageSubresourceLayers,
	dstOffsets Offset3D,
	dstOffsets Offset3D,
}

type BufferImageCopy {
	bufferOffset DeviceSize,
	bufferRowLength int,
	bufferImageHeight int,
	imageSubresource ImageSubresourceLayers,
	imageOffset Offset3D,
	imageExtent Extent3D,
	imageExtent Extent3D,
}

type ClearDepthStencilValue {
	depth real,
	stencil int,
	stencil int,
}

type ClearAttachment {
	aspectMask ImageAspectFlags,
	colorAttachment int,
	clearValue ClearValue,
	clearValue ClearValue,
}

type ClearRect {
	rect Rect2D,
	baseArrayLayer int,
	layerCount int,
	layerCount int,
}

type ImageResolve {
	srcSubresource ImageSubresourceLayers,
	srcOffset Offset3D,
	dstSubresource ImageSubresourceLayers,
	dstOffset Offset3D,
	extent Extent3D,
	extent Extent3D,
}

type MemoryBarrier {
	sType StructureType,
	pNext *[],
	srcAccessMask AccessFlags,
	dstAccessMask AccessFlags,
	dstAccessMask AccessFlags,
}

type BufferMemoryBarrier {
	sType StructureType,
	pNext *[],
	srcAccessMask AccessFlags,
	dstAccessMask AccessFlags,
	srcQueueFamilyIndex int,
	dstQueueFamilyIndex int,
	buffer Buffer,
	offset DeviceSize,
	size DeviceSize,
	size DeviceSize,
}

type ImageMemoryBarrier {
	sType StructureType,
	pNext *[],
	srcAccessMask AccessFlags,
	dstAccessMask AccessFlags,
	oldLayout ImageLayout,
	newLayout ImageLayout,
	srcQueueFamilyIndex int,
	dstQueueFamilyIndex int,
	image Image,
	subresourceRange ImageSubresourceRange,
	subresourceRange ImageSubresourceRange,
}

type RenderPassBeginInfo {
	sType StructureType,
	pNext *[],
	renderPass RenderPass,
	framebuffer Framebuffer,
	renderArea Rect2D,
	clearValueCount int,
	pClearValues *ClearValue,
	pClearValues *ClearValue,
}

type DispatchIndirectCommand {
	x int,
	y int,
	z int,
	z int,
}

type DrawIndexedIndirectCommand {
	indexCount int,
	instanceCount int,
	firstIndex int,
	vertexOffset int32_t,
	firstInstance int,
	firstInstance int,
}

type DrawIndirectCommand {
	vertexCount int,
	instanceCount int,
	firstVertex int,
	firstInstance int,
	firstInstance int,
}

type BaseOutStructure {
	sType StructureType,
	pNext *BaseOutStructure,
	pNext *BaseOutStructure,
}

type BaseInStructure {
	sType StructureType,
	pNext *BaseInStructure,
	pNext *BaseInStructure,
}

type PhysicalDeviceSubgroupProperties {
	sType StructureType,
	pNext *[],
	subgroupSize int,
	supportedStages ShaderStageFlags,
	supportedOperations SubgroupFeatureFlags,
	quadOperationsInAllStages Bool32,
	quadOperationsInAllStages Bool32,
}

type BindBufferMemoryInfo {
	sType StructureType,
	pNext *[],
	buffer Buffer,
	memory DeviceMemory,
	memoryOffset DeviceSize,
	memoryOffset DeviceSize,
}

type BindImageMemoryInfo {
	sType StructureType,
	pNext *[],
	image Image,
	memory DeviceMemory,
	memoryOffset DeviceSize,
	memoryOffset DeviceSize,
}

type PhysicalDevice16BitStorageFeatures {
	sType StructureType,
	pNext *[],
	storageBuffer16BitAccess Bool32,
	uniformAndStorageBuffer16BitAccess Bool32,
	storagePushConstant16 Bool32,
	storageInputOutput16 Bool32,
	storageInputOutput16 Bool32,
}

type MemoryDedicatedRequirements {
	sType StructureType,
	pNext *[],
	prefersDedicatedAllocation Bool32,
	requiresDedicatedAllocation Bool32,
	requiresDedicatedAllocation Bool32,
}

type MemoryDedicatedAllocateInfo {
	sType StructureType,
	pNext *[],
	image Image,
	buffer Buffer,
	buffer Buffer,
}

type MemoryAllocateFlagsInfo {
	sType StructureType,
	pNext *[],
	flags MemoryAllocateFlags,
	deviceMask int,
	deviceMask int,
}

type DeviceGroupRenderPassBeginInfo {
	sType StructureType,
	pNext *[],
	deviceMask int,
	deviceRenderAreaCount int,
	pDeviceRenderAreas *Rect2D,
	pDeviceRenderAreas *Rect2D,
}

type DeviceGroupCommandBufferBeginInfo {
	sType StructureType,
	pNext *[],
	deviceMask int,
	deviceMask int,
}

type DeviceGroupSubmitInfo {
	sType StructureType,
	pNext *[],
	waitSemaphoreCount int,
	pWaitSemaphoreDeviceIndices *int,
	commandBufferCount int,
	pCommandBufferDeviceMasks *int,
	signalSemaphoreCount int,
	pSignalSemaphoreDeviceIndices *int,
	pSignalSemaphoreDeviceIndices *int,
}

type DeviceGroupBindSparseInfo {
	sType StructureType,
	pNext *[],
	resourceDeviceIndex int,
	memoryDeviceIndex int,
	memoryDeviceIndex int,
}

type BindBufferMemoryDeviceGroupInfo {
	sType StructureType,
	pNext *[],
	deviceIndexCount int,
	pDeviceIndices *int,
	pDeviceIndices *int,
}

type BindImageMemoryDeviceGroupInfo {
	sType StructureType,
	pNext *[],
	deviceIndexCount int,
	pDeviceIndices *int,
	splitInstanceBindRegionCount int,
	pSplitInstanceBindRegions *Rect2D,
	pSplitInstanceBindRegions *Rect2D,
}

type PhysicalDeviceGroupProperties {
	sType StructureType,
	pNext *[],
	physicalDeviceCount int,
	physicalDevices PhysicalDevice,
	subsetAllocation Bool32,
	subsetAllocation Bool32,
}

type DeviceGroupDeviceCreateInfo {
	sType StructureType,
	pNext *[],
	physicalDeviceCount int,
	pPhysicalDevices *PhysicalDevice,
	pPhysicalDevices *PhysicalDevice,
}

type BufferMemoryRequirementsInfo2 {
	sType StructureType,
	pNext *[],
	buffer Buffer,
	buffer Buffer,
}

type ImageMemoryRequirementsInfo2 {
	sType StructureType,
	pNext *[],
	image Image,
	image Image,
}

type ImageSparseMemoryRequirementsInfo2 {
	sType StructureType,
	pNext *[],
	image Image,
	image Image,
}

type MemoryRequirements2 {
	sType StructureType,
	pNext *[],
	memoryRequirements MemoryRequirements,
	memoryRequirements MemoryRequirements,
}

type SparseImageMemoryRequirements2 {
	sType StructureType,
	pNext *[],
	memoryRequirements SparseImageMemoryRequirements,
	memoryRequirements SparseImageMemoryRequirements,
}

type PhysicalDeviceFeatures2 {
	sType StructureType,
	pNext *[],
	features PhysicalDeviceFeatures,
	features PhysicalDeviceFeatures,
}

type PhysicalDeviceProperties2 {
	sType StructureType,
	pNext *[],
	properties PhysicalDeviceProperties,
	properties PhysicalDeviceProperties,
}

type FormatProperties2 {
	sType StructureType,
	pNext *[],
	formatProperties FormatProperties,
	formatProperties FormatProperties,
}

type ImageFormatProperties2 {
	sType StructureType,
	pNext *[],
	imageFormatProperties ImageFormatProperties,
	imageFormatProperties ImageFormatProperties,
}

type PhysicalDeviceImageFormatInfo2 {
	sType StructureType,
	pNext *[],
	format Format,
	ty ImageType,
	tiling ImageTiling,
	usage ImageUsageFlags,
	flags ImageCreateFlags,
	flags ImageCreateFlags,
}

type QueueFamilyProperties2 {
	sType StructureType,
	pNext *[],
	queueFamilyProperties QueueFamilyProperties,
	queueFamilyProperties QueueFamilyProperties,
}

type PhysicalDeviceMemoryProperties2 {
	sType StructureType,
	pNext *[],
	memoryProperties PhysicalDeviceMemoryProperties,
	memoryProperties PhysicalDeviceMemoryProperties,
}

type SparseImageFormatProperties2 {
	sType StructureType,
	pNext *[],
	properties SparseImageFormatProperties,
	properties SparseImageFormatProperties,
}

type PhysicalDeviceSparseImageFormatInfo2 {
	sType StructureType,
	pNext *[],
	format Format,
	ty ImageType,
	samples SampleCountFlagBits,
	usage ImageUsageFlags,
	tiling ImageTiling,
	tiling ImageTiling,
}

type PhysicalDevicePointClippingProperties {
	sType StructureType,
	pNext *[],
	pointClippingBehavior PointClippingBehavior,
	pointClippingBehavior PointClippingBehavior,
}

type InputAttachmentAspectReference {
	subpass int,
	inputAttachmentIndex int,
	aspectMask ImageAspectFlags,
	aspectMask ImageAspectFlags,
}

type RenderPassInputAttachmentAspectCreateInfo {
	sType StructureType,
	pNext *[],
	aspectReferenceCount int,
	pAspectReferences *InputAttachmentAspectReference,
	pAspectReferences *InputAttachmentAspectReference,
}

type ImageViewUsageCreateInfo {
	sType StructureType,
	pNext *[],
	usage ImageUsageFlags,
	usage ImageUsageFlags,
}

type PipelineTessellationDomainOriginStateCreateInfo {
	sType StructureType,
	pNext *[],
	domainOrigin TessellationDomainOrigin,
	domainOrigin TessellationDomainOrigin,
}

type RenderPassMultiviewCreateInfo {
	sType StructureType,
	pNext *[],
	subpassCount int,
	pViewMasks *int,
	dependencyCount int,
	pViewOffsets *int32_t,
	correlationMaskCount int,
	pCorrelationMasks *int,
	pCorrelationMasks *int,
}

type PhysicalDeviceMultiviewFeatures {
	sType StructureType,
	pNext *[],
	multiview Bool32,
	multiviewGeometryShader Bool32,
	multiviewTessellationShader Bool32,
	multiviewTessellationShader Bool32,
}

type PhysicalDeviceMultiviewProperties {
	sType StructureType,
	pNext *[],
	maxMultiviewViewCount int,
	maxMultiviewInstanceIndex int,
	maxMultiviewInstanceIndex int,
}

type PhysicalDeviceVariablePointersFeatures {
	sType StructureType,
	pNext *[],
	variablePointersStorageBuffer Bool32,
	variablePointers Bool32,
	variablePointers Bool32,
}

type PhysicalDeviceProtectedMemoryFeatures {
	sType StructureType,
	pNext *[],
	protectedMemory Bool32,
	protectedMemory Bool32,
}

type PhysicalDeviceProtectedMemoryProperties {
	sType StructureType,
	pNext *[],
	protectedNoFault Bool32,
	protectedNoFault Bool32,
}

type DeviceQueueInfo2 {
	sType StructureType,
	pNext *[],
	flags DeviceQueueCreateFlags,
	queueFamilyIndex int,
	queueIndex int,
	queueIndex int,
}

type ProtectedSubmitInfo {
	sType StructureType,
	pNext *[],
	protectedSubmit Bool32,
	protectedSubmit Bool32,
}

type SamplerYcbcrConversionCreateInfo {
	sType StructureType,
	pNext *[],
	format Format,
	ycbcrModel SamplerYcbcrModelConversion,
	ycbcrRange SamplerYcbcrRange,
	components ComponentMapping,
	xChromaOffset ChromaLocation,
	yChromaOffset ChromaLocation,
	chromaFilter Filter,
	forceExplicitReconstruction Bool32,
	forceExplicitReconstruction Bool32,
}

type SamplerYcbcrConversionInfo {
	sType StructureType,
	pNext *[],
	conversion SamplerYcbcrConversion,
	conversion SamplerYcbcrConversion,
}

type BindImagePlaneMemoryInfo {
	sType StructureType,
	pNext *[],
	planeAspect ImageAspectFlagBits,
	planeAspect ImageAspectFlagBits,
}

type ImagePlaneMemoryRequirementsInfo {
	sType StructureType,
	pNext *[],
	planeAspect ImageAspectFlagBits,
	planeAspect ImageAspectFlagBits,
}

type PhysicalDeviceSamplerYcbcrConversionFeatures {
	sType StructureType,
	pNext *[],
	samplerYcbcrConversion Bool32,
	samplerYcbcrConversion Bool32,
}

type SamplerYcbcrConversionImageFormatProperties {
	sType StructureType,
	pNext *[],
	combinedImageSamplerDescriptorCount int,
	combinedImageSamplerDescriptorCount int,
}

type DescriptorUpdateTemplateEntry {
	dstBinding int,
	dstArrayElement int,
	descriptorCount int,
	descriptorType DescriptorType,
	offset size_t,
	stride size_t,
	stride size_t,
}

type DescriptorUpdateTemplateCreateInfo {
	sType StructureType,
	pNext *[],
	flags DescriptorUpdateTemplateCreateFlags,
	descriptorUpdateEntryCount int,
	pDescriptorUpdateEntries *DescriptorUpdateTemplateEntry,
	templateType DescriptorUpdateTemplateType,
	descriptorSetLayout DescriptorSetLayout,
	pipelineBindPoint PipelineBindPoint,
	pipelineLayout PipelineLayout,
	set int,
	set int,
}

type ExternalMemoryProperties {
	externalMemoryFeatures ExternalMemoryFeatureFlags,
	exportFromImportedHandleTypes ExternalMemoryHandleTypeFlags,
	compatibleHandleTypes ExternalMemoryHandleTypeFlags,
	compatibleHandleTypes ExternalMemoryHandleTypeFlags,
}

type PhysicalDeviceExternalImageFormatInfo {
	sType StructureType,
	pNext *[],
	handleType ExternalMemoryHandleTypeFlagBits,
	handleType ExternalMemoryHandleTypeFlagBits,
}

type ExternalImageFormatProperties {
	sType StructureType,
	pNext *[],
	externalMemoryProperties ExternalMemoryProperties,
	externalMemoryProperties ExternalMemoryProperties,
}

type PhysicalDeviceExternalBufferInfo {
	sType StructureType,
	pNext *[],
	flags BufferCreateFlags,
	usage BufferUsageFlags,
	handleType ExternalMemoryHandleTypeFlagBits,
	handleType ExternalMemoryHandleTypeFlagBits,
}

type ExternalBufferProperties {
	sType StructureType,
	pNext *[],
	externalMemoryProperties ExternalMemoryProperties,
	externalMemoryProperties ExternalMemoryProperties,
}

type PhysicalDeviceIDProperties {
	sType StructureType,
	pNext *[],
	deviceUUID uint8_t,
	driverUUID uint8_t,
	deviceLUID uint8_t,
	deviceNodeMask int,
	deviceLUIDValid Bool32,
	deviceLUIDValid Bool32,
}

type ExternalMemoryImageCreateInfo {
	sType StructureType,
	pNext *[],
	handleTypes ExternalMemoryHandleTypeFlags,
	handleTypes ExternalMemoryHandleTypeFlags,
}

type ExternalMemoryBufferCreateInfo {
	sType StructureType,
	pNext *[],
	handleTypes ExternalMemoryHandleTypeFlags,
	handleTypes ExternalMemoryHandleTypeFlags,
}

type ExportMemoryAllocateInfo {
	sType StructureType,
	pNext *[],
	handleTypes ExternalMemoryHandleTypeFlags,
	handleTypes ExternalMemoryHandleTypeFlags,
}

type PhysicalDeviceExternalFenceInfo {
	sType StructureType,
	pNext *[],
	handleType ExternalFenceHandleTypeFlagBits,
	handleType ExternalFenceHandleTypeFlagBits,
}

type ExternalFenceProperties {
	sType StructureType,
	pNext *[],
	exportFromImportedHandleTypes ExternalFenceHandleTypeFlags,
	compatibleHandleTypes ExternalFenceHandleTypeFlags,
	externalFenceFeatures ExternalFenceFeatureFlags,
	externalFenceFeatures ExternalFenceFeatureFlags,
}

type ExportFenceCreateInfo {
	sType StructureType,
	pNext *[],
	handleTypes ExternalFenceHandleTypeFlags,
	handleTypes ExternalFenceHandleTypeFlags,
}

type ExportSemaphoreCreateInfo {
	sType StructureType,
	pNext *[],
	handleTypes ExternalSemaphoreHandleTypeFlags,
	handleTypes ExternalSemaphoreHandleTypeFlags,
}

type PhysicalDeviceExternalSemaphoreInfo {
	sType StructureType,
	pNext *[],
	handleType ExternalSemaphoreHandleTypeFlagBits,
	handleType ExternalSemaphoreHandleTypeFlagBits,
}

type ExternalSemaphoreProperties {
	sType StructureType,
	pNext *[],
	exportFromImportedHandleTypes ExternalSemaphoreHandleTypeFlags,
	compatibleHandleTypes ExternalSemaphoreHandleTypeFlags,
	externalSemaphoreFeatures ExternalSemaphoreFeatureFlags,
	externalSemaphoreFeatures ExternalSemaphoreFeatureFlags,
}

type PhysicalDeviceMaintenance3Properties {
	sType StructureType,
	pNext *[],
	maxPerSetDescriptors int,
	maxMemoryAllocationSize DeviceSize,
	maxMemoryAllocationSize DeviceSize,
}

type DescriptorSetLayoutSupport {
	sType StructureType,
	pNext *[],
	supported Bool32,
	supported Bool32,
}

type PhysicalDeviceShaderDrawParametersFeatures {
	sType StructureType,
	pNext *[],
	shaderDrawParameters Bool32,
	shaderDrawParameters Bool32,
}

type PhysicalDeviceVulkan11Features {
	sType StructureType,
	pNext *[],
	storageBuffer16BitAccess Bool32,
	uniformAndStorageBuffer16BitAccess Bool32,
	storagePushConstant16 Bool32,
	storageInputOutput16 Bool32,
	multiview Bool32,
	multiviewGeometryShader Bool32,
	multiviewTessellationShader Bool32,
	variablePointersStorageBuffer Bool32,
	variablePointers Bool32,
	protectedMemory Bool32,
	samplerYcbcrConversion Bool32,
	shaderDrawParameters Bool32,
	shaderDrawParameters Bool32,
}

type PhysicalDeviceVulkan11Properties {
	sType StructureType,
	pNext *[],
	deviceUUID uint8_t,
	driverUUID uint8_t,
	deviceLUID uint8_t,
	deviceNodeMask int,
	deviceLUIDValid Bool32,
	subgroupSize int,
	subgroupSupportedStages ShaderStageFlags,
	subgroupSupportedOperations SubgroupFeatureFlags,
	subgroupQuadOperationsInAllStages Bool32,
	pointClippingBehavior PointClippingBehavior,
	maxMultiviewViewCount int,
	maxMultiviewInstanceIndex int,
	protectedNoFault Bool32,
	maxPerSetDescriptors int,
	maxMemoryAllocationSize DeviceSize,
	maxMemoryAllocationSize DeviceSize,
}

type PhysicalDeviceVulkan12Features {
	sType StructureType,
	pNext *[],
	samplerMirrorClampToEdge Bool32,
	drawIndirectCount Bool32,
	storageBuffer8BitAccess Bool32,
	uniformAndStorageBuffer8BitAccess Bool32,
	storagePushConstant8 Bool32,
	shaderBufferInt64Atomics Bool32,
	shaderSharedInt64Atomics Bool32,
	shaderFloat16 Bool32,
	shaderInt8 Bool32,
	descriptorIndexing Bool32,
	shaderInputAttachmentArrayDynamicIndexing Bool32,
	shaderUniformTexelBufferArrayDynamicIndexing Bool32,
	shaderStorageTexelBufferArrayDynamicIndexing Bool32,
	shaderUniformBufferArrayNonUniformIndexing Bool32,
	shaderSampledImageArrayNonUniformIndexing Bool32,
	shaderStorageBufferArrayNonUniformIndexing Bool32,
	shaderStorageImageArrayNonUniformIndexing Bool32,
	shaderInputAttachmentArrayNonUniformIndexing Bool32,
	shaderUniformTexelBufferArrayNonUniformIndexing Bool32,
	shaderStorageTexelBufferArrayNonUniformIndexing Bool32,
	descriptorBindingUniformBufferUpdateAfterBind Bool32,
	descriptorBindingSampledImageUpdateAfterBind Bool32,
	descriptorBindingStorageImageUpdateAfterBind Bool32,
	descriptorBindingStorageBufferUpdateAfterBind Bool32,
	descriptorBindingUniformTexelBufferUpdateAfterBind Bool32,
	descriptorBindingStorageTexelBufferUpdateAfterBind Bool32,
	descriptorBindingUpdateUnusedWhilePending Bool32,
	descriptorBindingPartiallyBound Bool32,
	descriptorBindingVariableDescriptorCount Bool32,
	runtimeDescriptorArray Bool32,
	samplerFilterMinmax Bool32,
	scalarBlockLayout Bool32,
	imagelessFramebuffer Bool32,
	uniformBufferStandardLayout Bool32,
	shaderSubgroupExtendedTypes Bool32,
	separateDepthStencilLayouts Bool32,
	hostQueryReset Bool32,
	timelineSemaphore Bool32,
	bufferDeviceAddress Bool32,
	bufferDeviceAddressCaptureReplay Bool32,
	bufferDeviceAddressMultiDevice Bool32,
	vulkanMemoryModel Bool32,
	vulkanMemoryModelDeviceScope Bool32,
	vulkanMemoryModelAvailabilityVisibilityChains Bool32,
	shaderOutputViewportIndex Bool32,
	shaderOutputLayer Bool32,
	subgroupBroadcastDynamicId Bool32,
	subgroupBroadcastDynamicId Bool32,
}

type ConformanceVersion {
	major uint8_t,
	minor uint8_t,
	subminor uint8_t,
	patch uint8_t,
	patch uint8_t,
}

type PhysicalDeviceVulkan12Properties {
	sType StructureType,
	pNext *[],
	driverID DriverId,
	driverName byte,
	driverInfo byte,
	conformanceVersion ConformanceVersion,
	denormBehaviorIndependence ShaderFloatControlsIndependence,
	roundingModeIndependence ShaderFloatControlsIndependence,
	shaderSignedZeroInfNanPreserveFloat16 Bool32,
	shaderSignedZeroInfNanPreserveFloat32 Bool32,
	shaderSignedZeroInfNanPreserveFloat64 Bool32,
	shaderDenormPreserveFloat16 Bool32,
	shaderDenormPreserveFloat32 Bool32,
	shaderDenormPreserveFloat64 Bool32,
	shaderDenormFlushToZeroFloat16 Bool32,
	shaderDenormFlushToZeroFloat32 Bool32,
	shaderDenormFlushToZeroFloat64 Bool32,
	shaderRoundingModeRTEFloat16 Bool32,
	shaderRoundingModeRTEFloat32 Bool32,
	shaderRoundingModeRTEFloat64 Bool32,
	shaderRoundingModeRTZFloat16 Bool32,
	shaderRoundingModeRTZFloat32 Bool32,
	shaderRoundingModeRTZFloat64 Bool32,
	maxUpdateAfterBindDescriptorsInAllPools int,
	shaderUniformBufferArrayNonUniformIndexingNative Bool32,
	shaderSampledImageArrayNonUniformIndexingNative Bool32,
	shaderStorageBufferArrayNonUniformIndexingNative Bool32,
	shaderStorageImageArrayNonUniformIndexingNative Bool32,
	shaderInputAttachmentArrayNonUniformIndexingNative Bool32,
	robustBufferAccessUpdateAfterBind Bool32,
	quadDivergentImplicitLod Bool32,
	maxPerStageDescriptorUpdateAfterBindSamplers int,
	maxPerStageDescriptorUpdateAfterBindUniformBuffers int,
	maxPerStageDescriptorUpdateAfterBindStorageBuffers int,
	maxPerStageDescriptorUpdateAfterBindSampledImages int,
	maxPerStageDescriptorUpdateAfterBindStorageImages int,
	maxPerStageDescriptorUpdateAfterBindInputAttachments int,
	maxPerStageUpdateAfterBindResources int,
	maxDescriptorSetUpdateAfterBindSamplers int,
	maxDescriptorSetUpdateAfterBindUniformBuffers int,
	maxDescriptorSetUpdateAfterBindUniformBuffersDynamic int,
	maxDescriptorSetUpdateAfterBindStorageBuffers int,
	maxDescriptorSetUpdateAfterBindStorageBuffersDynamic int,
	maxDescriptorSetUpdateAfterBindSampledImages int,
	maxDescriptorSetUpdateAfterBindStorageImages int,
	maxDescriptorSetUpdateAfterBindInputAttachments int,
	supportedDepthResolveModes ResolveModeFlags,
	supportedStencilResolveModes ResolveModeFlags,
	independentResolveNone Bool32,
	independentResolve Bool32,
	filterMinmaxSingleComponentFormats Bool32,
	filterMinmaxImageComponentMapping Bool32,
	maxTimelineSemaphoreValueDifference uint64_t,
	framebufferIntegerColorSampleCounts SampleCountFlags,
	framebufferIntegerColorSampleCounts SampleCountFlags,
}

type ImageFormatListCreateInfo {
	sType StructureType,
	pNext *[],
	viewFormatCount int,
	pViewFormats *Format,
	pViewFormats *Format,
}

type AttachmentDescription2 {
	sType StructureType,
	pNext *[],
	flags AttachmentDescriptionFlags,
	format Format,
	samples SampleCountFlagBits,
	loadOp AttachmentLoadOp,
	storeOp AttachmentStoreOp,
	stencilLoadOp AttachmentLoadOp,
	stencilStoreOp AttachmentStoreOp,
	initialLayout ImageLayout,
	finalLayout ImageLayout,
	finalLayout ImageLayout,
}

type AttachmentReference2 {
	sType StructureType,
	pNext *[],
	attachment int,
	layout ImageLayout,
	aspectMask ImageAspectFlags,
	aspectMask ImageAspectFlags,
}

type SubpassDescription2 {
	sType StructureType,
	pNext *[],
	flags SubpassDescriptionFlags,
	pipelineBindPoint PipelineBindPoint,
	viewMask int,
	inputAttachmentCount int,
	pInputAttachments *AttachmentReference2,
	colorAttachmentCount int,
	pColorAttachments *AttachmentReference2,
	pResolveAttachments *AttachmentReference2,
	pDepthStencilAttachment *AttachmentReference2,
	preserveAttachmentCount int,
	pPreserveAttachments *int,
	pPreserveAttachments *int,
}

type SubpassDependency2 {
	sType StructureType,
	pNext *[],
	srcSubpass int,
	dstSubpass int,
	srcStageMask PipelineStageFlags,
	dstStageMask PipelineStageFlags,
	srcAccessMask AccessFlags,
	dstAccessMask AccessFlags,
	dependencyFlags DependencyFlags,
	viewOffset int32_t,
	viewOffset int32_t,
}

type RenderPassCreateInfo2 {
	sType StructureType,
	pNext *[],
	flags RenderPassCreateFlags,
	attachmentCount int,
	pAttachments *AttachmentDescription2,
	subpassCount int,
	pSubpasses *SubpassDescription2,
	dependencyCount int,
	pDependencies *SubpassDependency2,
	correlatedViewMaskCount int,
	pCorrelatedViewMasks *int,
	pCorrelatedViewMasks *int,
}

type SubpassBeginInfo {
	sType StructureType,
	pNext *[],
	contents SubpassContents,
	contents SubpassContents,
}

type SubpassEndInfo {
	sType StructureType,
	pNext *[],
	pNext *[],
}

type PhysicalDevice8BitStorageFeatures {
	sType StructureType,
	pNext *[],
	storageBuffer8BitAccess Bool32,
	uniformAndStorageBuffer8BitAccess Bool32,
	storagePushConstant8 Bool32,
	storagePushConstant8 Bool32,
}

type PhysicalDeviceDriverProperties {
	sType StructureType,
	pNext *[],
	driverID DriverId,
	driverName byte,
	driverInfo byte,
	conformanceVersion ConformanceVersion,
	conformanceVersion ConformanceVersion,
}

type PhysicalDeviceShaderAtomicInt64Features {
	sType StructureType,
	pNext *[],
	shaderBufferInt64Atomics Bool32,
	shaderSharedInt64Atomics Bool32,
	shaderSharedInt64Atomics Bool32,
}

type PhysicalDeviceShaderFloat16Int8Features {
	sType StructureType,
	pNext *[],
	shaderFloat16 Bool32,
	shaderInt8 Bool32,
	shaderInt8 Bool32,
}

type PhysicalDeviceFloatControlsProperties {
	sType StructureType,
	pNext *[],
	denormBehaviorIndependence ShaderFloatControlsIndependence,
	roundingModeIndependence ShaderFloatControlsIndependence,
	shaderSignedZeroInfNanPreserveFloat16 Bool32,
	shaderSignedZeroInfNanPreserveFloat32 Bool32,
	shaderSignedZeroInfNanPreserveFloat64 Bool32,
	shaderDenormPreserveFloat16 Bool32,
	shaderDenormPreserveFloat32 Bool32,
	shaderDenormPreserveFloat64 Bool32,
	shaderDenormFlushToZeroFloat16 Bool32,
	shaderDenormFlushToZeroFloat32 Bool32,
	shaderDenormFlushToZeroFloat64 Bool32,
	shaderRoundingModeRTEFloat16 Bool32,
	shaderRoundingModeRTEFloat32 Bool32,
	shaderRoundingModeRTEFloat64 Bool32,
	shaderRoundingModeRTZFloat16 Bool32,
	shaderRoundingModeRTZFloat32 Bool32,
	shaderRoundingModeRTZFloat64 Bool32,
	shaderRoundingModeRTZFloat64 Bool32,
}

type DescriptorSetLayoutBindingFlagsCreateInfo {
	sType StructureType,
	pNext *[],
	bindingCount int,
	pBindingFlags *DescriptorBindingFlags,
	pBindingFlags *DescriptorBindingFlags,
}

type PhysicalDeviceDescriptorIndexingFeatures {
	sType StructureType,
	pNext *[],
	shaderInputAttachmentArrayDynamicIndexing Bool32,
	shaderUniformTexelBufferArrayDynamicIndexing Bool32,
	shaderStorageTexelBufferArrayDynamicIndexing Bool32,
	shaderUniformBufferArrayNonUniformIndexing Bool32,
	shaderSampledImageArrayNonUniformIndexing Bool32,
	shaderStorageBufferArrayNonUniformIndexing Bool32,
	shaderStorageImageArrayNonUniformIndexing Bool32,
	shaderInputAttachmentArrayNonUniformIndexing Bool32,
	shaderUniformTexelBufferArrayNonUniformIndexing Bool32,
	shaderStorageTexelBufferArrayNonUniformIndexing Bool32,
	descriptorBindingUniformBufferUpdateAfterBind Bool32,
	descriptorBindingSampledImageUpdateAfterBind Bool32,
	descriptorBindingStorageImageUpdateAfterBind Bool32,
	descriptorBindingStorageBufferUpdateAfterBind Bool32,
	descriptorBindingUniformTexelBufferUpdateAfterBind Bool32,
	descriptorBindingStorageTexelBufferUpdateAfterBind Bool32,
	descriptorBindingUpdateUnusedWhilePending Bool32,
	descriptorBindingPartiallyBound Bool32,
	descriptorBindingVariableDescriptorCount Bool32,
	runtimeDescriptorArray Bool32,
	runtimeDescriptorArray Bool32,
}

type PhysicalDeviceDescriptorIndexingProperties {
	sType StructureType,
	pNext *[],
	maxUpdateAfterBindDescriptorsInAllPools int,
	shaderUniformBufferArrayNonUniformIndexingNative Bool32,
	shaderSampledImageArrayNonUniformIndexingNative Bool32,
	shaderStorageBufferArrayNonUniformIndexingNative Bool32,
	shaderStorageImageArrayNonUniformIndexingNative Bool32,
	shaderInputAttachmentArrayNonUniformIndexingNative Bool32,
	robustBufferAccessUpdateAfterBind Bool32,
	quadDivergentImplicitLod Bool32,
	maxPerStageDescriptorUpdateAfterBindSamplers int,
	maxPerStageDescriptorUpdateAfterBindUniformBuffers int,
	maxPerStageDescriptorUpdateAfterBindStorageBuffers int,
	maxPerStageDescriptorUpdateAfterBindSampledImages int,
	maxPerStageDescriptorUpdateAfterBindStorageImages int,
	maxPerStageDescriptorUpdateAfterBindInputAttachments int,
	maxPerStageUpdateAfterBindResources int,
	maxDescriptorSetUpdateAfterBindSamplers int,
	maxDescriptorSetUpdateAfterBindUniformBuffers int,
	maxDescriptorSetUpdateAfterBindUniformBuffersDynamic int,
	maxDescriptorSetUpdateAfterBindStorageBuffers int,
	maxDescriptorSetUpdateAfterBindStorageBuffersDynamic int,
	maxDescriptorSetUpdateAfterBindSampledImages int,
	maxDescriptorSetUpdateAfterBindStorageImages int,
	maxDescriptorSetUpdateAfterBindInputAttachments int,
	maxDescriptorSetUpdateAfterBindInputAttachments int,
}

type DescriptorSetVariableDescriptorCountAllocateInfo {
	sType StructureType,
	pNext *[],
	descriptorSetCount int,
	pDescriptorCounts *int,
	pDescriptorCounts *int,
}

type DescriptorSetVariableDescriptorCountLayoutSupport {
	sType StructureType,
	pNext *[],
	maxVariableDescriptorCount int,
	maxVariableDescriptorCount int,
}

type SubpassDescriptionDepthStencilResolve {
	sType StructureType,
	pNext *[],
	depthResolveMode ResolveModeFlagBits,
	stencilResolveMode ResolveModeFlagBits,
	pDepthStencilResolveAttachment *AttachmentReference2,
	pDepthStencilResolveAttachment *AttachmentReference2,
}

type PhysicalDeviceDepthStencilResolveProperties {
	sType StructureType,
	pNext *[],
	supportedDepthResolveModes ResolveModeFlags,
	supportedStencilResolveModes ResolveModeFlags,
	independentResolveNone Bool32,
	independentResolve Bool32,
	independentResolve Bool32,
}

type PhysicalDeviceScalarBlockLayoutFeatures {
	sType StructureType,
	pNext *[],
	scalarBlockLayout Bool32,
	scalarBlockLayout Bool32,
}

type ImageStencilUsageCreateInfo {
	sType StructureType,
	pNext *[],
	stencilUsage ImageUsageFlags,
	stencilUsage ImageUsageFlags,
}

type SamplerReductionModeCreateInfo {
	sType StructureType,
	pNext *[],
	reductionMode SamplerReductionMode,
	reductionMode SamplerReductionMode,
}

type PhysicalDeviceSamplerFilterMinmaxProperties {
	sType StructureType,
	pNext *[],
	filterMinmaxSingleComponentFormats Bool32,
	filterMinmaxImageComponentMapping Bool32,
	filterMinmaxImageComponentMapping Bool32,
}

type PhysicalDeviceVulkanMemoryModelFeatures {
	sType StructureType,
	pNext *[],
	vulkanMemoryModel Bool32,
	vulkanMemoryModelDeviceScope Bool32,
	vulkanMemoryModelAvailabilityVisibilityChains Bool32,
	vulkanMemoryModelAvailabilityVisibilityChains Bool32,
}

type PhysicalDeviceImagelessFramebufferFeatures {
	sType StructureType,
	pNext *[],
	imagelessFramebuffer Bool32,
	imagelessFramebuffer Bool32,
}

type FramebufferAttachmentImageInfo {
	sType StructureType,
	pNext *[],
	flags ImageCreateFlags,
	usage ImageUsageFlags,
	width int,
	height int,
	layerCount int,
	viewFormatCount int,
	pViewFormats *Format,
	pViewFormats *Format,
}

type FramebufferAttachmentsCreateInfo {
	sType StructureType,
	pNext *[],
	attachmentImageInfoCount int,
	pAttachmentImageInfos *FramebufferAttachmentImageInfo,
	pAttachmentImageInfos *FramebufferAttachmentImageInfo,
}

type RenderPassAttachmentBeginInfo {
	sType StructureType,
	pNext *[],
	attachmentCount int,
	pAttachments *ImageView,
	pAttachments *ImageView,
}

type PhysicalDeviceUniformBufferStandardLayoutFeatures {
	sType StructureType,
	pNext *[],
	uniformBufferStandardLayout Bool32,
	uniformBufferStandardLayout Bool32,
}

type PhysicalDeviceShaderSubgroupExtendedTypesFeatures {
	sType StructureType,
	pNext *[],
	shaderSubgroupExtendedTypes Bool32,
	shaderSubgroupExtendedTypes Bool32,
}

type PhysicalDeviceSeparateDepthStencilLayoutsFeatures {
	sType StructureType,
	pNext *[],
	separateDepthStencilLayouts Bool32,
	separateDepthStencilLayouts Bool32,
}

type AttachmentReferenceStencilLayout {
	sType StructureType,
	pNext *[],
	stencilLayout ImageLayout,
	stencilLayout ImageLayout,
}

type AttachmentDescriptionStencilLayout {
	sType StructureType,
	pNext *[],
	stencilInitialLayout ImageLayout,
	stencilFinalLayout ImageLayout,
	stencilFinalLayout ImageLayout,
}

type PhysicalDeviceHostQueryResetFeatures {
	sType StructureType,
	pNext *[],
	hostQueryReset Bool32,
	hostQueryReset Bool32,
}

type PhysicalDeviceTimelineSemaphoreFeatures {
	sType StructureType,
	pNext *[],
	timelineSemaphore Bool32,
	timelineSemaphore Bool32,
}

type PhysicalDeviceTimelineSemaphoreProperties {
	sType StructureType,
	pNext *[],
	maxTimelineSemaphoreValueDifference uint64_t,
	maxTimelineSemaphoreValueDifference uint64_t,
}

type SemaphoreTypeCreateInfo {
	sType StructureType,
	pNext *[],
	semaphoreType SemaphoreType,
	initialValue uint64_t,
	initialValue uint64_t,
}

type TimelineSemaphoreSubmitInfo {
	sType StructureType,
	pNext *[],
	waitSemaphoreValueCount int,
	pWaitSemaphoreValues *uint64_t,
	signalSemaphoreValueCount int,
	pSignalSemaphoreValues *uint64_t,
	pSignalSemaphoreValues *uint64_t,
}

type SemaphoreWaitInfo {
	sType StructureType,
	pNext *[],
	flags SemaphoreWaitFlags,
	semaphoreCount int,
	pSemaphores *Semaphore,
	pValues *uint64_t,
	pValues *uint64_t,
}

type SemaphoreSignalInfo {
	sType StructureType,
	pNext *[],
	semaphore Semaphore,
	value uint64_t,
	value uint64_t,
}

type PhysicalDeviceBufferDeviceAddressFeatures {
	sType StructureType,
	pNext *[],
	bufferDeviceAddress Bool32,
	bufferDeviceAddressCaptureReplay Bool32,
	bufferDeviceAddressMultiDevice Bool32,
	bufferDeviceAddressMultiDevice Bool32,
}

type BufferDeviceAddressInfo {
	sType StructureType,
	pNext *[],
	buffer Buffer,
	buffer Buffer,
}

type BufferOpaqueCaptureAddressCreateInfo {
	sType StructureType,
	pNext *[],
	opaqueCaptureAddress uint64_t,
	opaqueCaptureAddress uint64_t,
}

type MemoryOpaqueCaptureAddressAllocateInfo {
	sType StructureType,
	pNext *[],
	opaqueCaptureAddress uint64_t,
	opaqueCaptureAddress uint64_t,
}

type DeviceMemoryOpaqueCaptureAddressInfo {
	sType StructureType,
	pNext *[],
	memory DeviceMemory,
	memory DeviceMemory,
}

type SurfaceCapabilitiesKHR {
	minImageCount int,
	maxImageCount int,
	currentExtent Extent2D,
	minImageExtent Extent2D,
	maxImageExtent Extent2D,
	maxImageArrayLayers int,
	supportedTransforms SurfaceTransformFlagsKHR,
	currentTransform SurfaceTransformFlagBitsKHR,
	supportedCompositeAlpha CompositeAlphaFlagsKHR,
	supportedUsageFlags ImageUsageFlags,
	supportedUsageFlags ImageUsageFlags,
}

type SurfaceFormatKHR {
	format Format,
	colorSpace ColorSpaceKHR,
	colorSpace ColorSpaceKHR,
}

type SwapchainCreateInfoKHR {
	sType StructureType,
	pNext *[],
	flags SwapchainCreateFlagsKHR,
	surface SurfaceKHR,
	minImageCount int,
	imageFormat Format,
	imageColorSpace ColorSpaceKHR,
	imageExtent Extent2D,
	imageArrayLayers int,
	imageUsage ImageUsageFlags,
	imageSharingMode SharingMode,
	queueFamilyIndexCount int,
	pQueueFamilyIndices *int,
	preTransform SurfaceTransformFlagBitsKHR,
	compositeAlpha CompositeAlphaFlagBitsKHR,
	presentMode PresentModeKHR,
	clipped Bool32,
	oldSwapchain SwapchainKHR,
	oldSwapchain SwapchainKHR,
}

type PresentInfoKHR {
	sType StructureType,
	pNext *[],
	waitSemaphoreCount int,
	pWaitSemaphores *Semaphore,
	swapchainCount int,
	pSwapchains *SwapchainKHR,
	pImageIndices *int,
	pResults *Result,
	pResults *Result,
}

type ImageSwapchainCreateInfoKHR {
	sType StructureType,
	pNext *[],
	swapchain SwapchainKHR,
	swapchain SwapchainKHR,
}

type BindImageMemorySwapchainInfoKHR {
	sType StructureType,
	pNext *[],
	swapchain SwapchainKHR,
	imageIndex int,
	imageIndex int,
}

type AcquireNextImageInfoKHR {
	sType StructureType,
	pNext *[],
	swapchain SwapchainKHR,
	timeout uint64_t,
	semaphore Semaphore,
	fence Fence,
	deviceMask int,
	deviceMask int,
}

type DeviceGroupPresentCapabilitiesKHR {
	sType StructureType,
	pNext *[],
	presentMask int,
	modes DeviceGroupPresentModeFlagsKHR,
	modes DeviceGroupPresentModeFlagsKHR,
}

type DeviceGroupPresentInfoKHR {
	sType StructureType,
	pNext *[],
	swapchainCount int,
	pDeviceMasks *int,
	mode DeviceGroupPresentModeFlagBitsKHR,
	mode DeviceGroupPresentModeFlagBitsKHR,
}

type DeviceGroupSwapchainCreateInfoKHR {
	sType StructureType,
	pNext *[],
	modes DeviceGroupPresentModeFlagsKHR,
	modes DeviceGroupPresentModeFlagsKHR,
}

type DisplayPropertiesKHR {
	display DisplayKHR,
	displayName *byte,
	physicalDimensions Extent2D,
	physicalResolution Extent2D,
	supportedTransforms SurfaceTransformFlagsKHR,
	planeReorderPossible Bool32,
	persistentContent Bool32,
	persistentContent Bool32,
}

type DisplayModeParametersKHR {
	visibleRegion Extent2D,
	refreshRate int,
	refreshRate int,
}

type DisplayModePropertiesKHR {
	displayMode DisplayModeKHR,
	parameters DisplayModeParametersKHR,
	parameters DisplayModeParametersKHR,
}

type DisplayModeCreateInfoKHR {
	sType StructureType,
	pNext *[],
	flags DisplayModeCreateFlagsKHR,
	parameters DisplayModeParametersKHR,
	parameters DisplayModeParametersKHR,
}

type DisplayPlaneCapabilitiesKHR {
	supportedAlpha DisplayPlaneAlphaFlagsKHR,
	minSrcPosition Offset2D,
	maxSrcPosition Offset2D,
	minSrcExtent Extent2D,
	maxSrcExtent Extent2D,
	minDstPosition Offset2D,
	maxDstPosition Offset2D,
	minDstExtent Extent2D,
	maxDstExtent Extent2D,
	maxDstExtent Extent2D,
}

type DisplayPlanePropertiesKHR {
	currentDisplay DisplayKHR,
	currentStackIndex int,
	currentStackIndex int,
}

type DisplaySurfaceCreateInfoKHR {
	sType StructureType,
	pNext *[],
	flags DisplaySurfaceCreateFlagsKHR,
	displayMode DisplayModeKHR,
	planeIndex int,
	planeStackIndex int,
	transform SurfaceTransformFlagBitsKHR,
	globalAlpha real,
	alphaMode DisplayPlaneAlphaFlagBitsKHR,
	imageExtent Extent2D,
	imageExtent Extent2D,
}

type DisplayPresentInfoKHR {
	sType StructureType,
	pNext *[],
	srcRect Rect2D,
	dstRect Rect2D,
	persistent Bool32,
	persistent Bool32,
}

type ImportMemoryFdInfoKHR {
	sType StructureType,
	pNext *[],
	handleType ExternalMemoryHandleTypeFlagBits,
	fd int,
	fd int,
}

type MemoryFdPropertiesKHR {
	sType StructureType,
	pNext *[],
	memoryTypeBits int,
	memoryTypeBits int,
}

type MemoryGetFdInfoKHR {
	sType StructureType,
	pNext *[],
	memory DeviceMemory,
	handleType ExternalMemoryHandleTypeFlagBits,
	handleType ExternalMemoryHandleTypeFlagBits,
}

type ImportSemaphoreFdInfoKHR {
	sType StructureType,
	pNext *[],
	semaphore Semaphore,
	flags SemaphoreImportFlags,
	handleType ExternalSemaphoreHandleTypeFlagBits,
	fd int,
	fd int,
}

type SemaphoreGetFdInfoKHR {
	sType StructureType,
	pNext *[],
	semaphore Semaphore,
	handleType ExternalSemaphoreHandleTypeFlagBits,
	handleType ExternalSemaphoreHandleTypeFlagBits,
}

type PhysicalDevicePushDescriptorPropertiesKHR {
	sType StructureType,
	pNext *[],
	maxPushDescriptors int,
	maxPushDescriptors int,
}

type RectLayerKHR {
	offset Offset2D,
	extent Extent2D,
	layer int,
	layer int,
}

type PresentRegionKHR {
	rectangleCount int,
	pRectangles *RectLayerKHR,
	pRectangles *RectLayerKHR,
}

type PresentRegionsKHR {
	sType StructureType,
	pNext *[],
	swapchainCount int,
	pRegions *PresentRegionKHR,
	pRegions *PresentRegionKHR,
}

type SharedPresentSurfaceCapabilitiesKHR {
	sType StructureType,
	pNext *[],
	sharedPresentSupportedUsageFlags ImageUsageFlags,
	sharedPresentSupportedUsageFlags ImageUsageFlags,
}

type ImportFenceFdInfoKHR {
	sType StructureType,
	pNext *[],
	fence Fence,
	flags FenceImportFlags,
	handleType ExternalFenceHandleTypeFlagBits,
	fd int,
	fd int,
}

type FenceGetFdInfoKHR {
	sType StructureType,
	pNext *[],
	fence Fence,
	handleType ExternalFenceHandleTypeFlagBits,
	handleType ExternalFenceHandleTypeFlagBits,
}

type PhysicalDevicePerformanceQueryFeaturesKHR {
	sType StructureType,
	pNext *[],
	performanceCounterQueryPools Bool32,
	performanceCounterMultipleQueryPools Bool32,
	performanceCounterMultipleQueryPools Bool32,
}

type PhysicalDevicePerformanceQueryPropertiesKHR {
	sType StructureType,
	pNext *[],
	allowCommandBufferQueryCopies Bool32,
	allowCommandBufferQueryCopies Bool32,
}

type PerformanceCounterKHR {
	sType StructureType,
	pNext *[],
	unit PerformanceCounterUnitKHR,
	scope PerformanceCounterScopeKHR,
	storage PerformanceCounterStorageKHR,
	uuid uint8_t,
	uuid uint8_t,
}

type PerformanceCounterDescriptionKHR {
	sType StructureType,
	pNext *[],
	flags PerformanceCounterDescriptionFlagsKHR,
	name byte,
	category byte,
	description byte,
	description byte,
}

type QueryPoolPerformanceCreateInfoKHR {
	sType StructureType,
	pNext *[],
	queueFamilyIndex int,
	counterIndexCount int,
	pCounterIndices *int,
	pCounterIndices *int,
}

type AcquireProfilingLockInfoKHR {
	sType StructureType,
	pNext *[],
	flags AcquireProfilingLockFlagsKHR,
	timeout uint64_t,
	timeout uint64_t,
}

type PerformanceQuerySubmitInfoKHR {
	sType StructureType,
	pNext *[],
	counterPassIndex int,
	counterPassIndex int,
}

type PhysicalDeviceSurfaceInfo2KHR {
	sType StructureType,
	pNext *[],
	surface SurfaceKHR,
	surface SurfaceKHR,
}

type SurfaceCapabilities2KHR {
	sType StructureType,
	pNext *[],
	surfaceCapabilities SurfaceCapabilitiesKHR,
	surfaceCapabilities SurfaceCapabilitiesKHR,
}

type SurfaceFormat2KHR {
	sType StructureType,
	pNext *[],
	surfaceFormat SurfaceFormatKHR,
	surfaceFormat SurfaceFormatKHR,
}

type DisplayProperties2KHR {
	sType StructureType,
	pNext *[],
	displayProperties DisplayPropertiesKHR,
	displayProperties DisplayPropertiesKHR,
}

type DisplayPlaneProperties2KHR {
	sType StructureType,
	pNext *[],
	displayPlaneProperties DisplayPlanePropertiesKHR,
	displayPlaneProperties DisplayPlanePropertiesKHR,
}

type DisplayModeProperties2KHR {
	sType StructureType,
	pNext *[],
	displayModeProperties DisplayModePropertiesKHR,
	displayModeProperties DisplayModePropertiesKHR,
}

type DisplayPlaneInfo2KHR {
	sType StructureType,
	pNext *[],
	mode DisplayModeKHR,
	planeIndex int,
	planeIndex int,
}

type DisplayPlaneCapabilities2KHR {
	sType StructureType,
	pNext *[],
	capabilities DisplayPlaneCapabilitiesKHR,
	capabilities DisplayPlaneCapabilitiesKHR,
}

type PhysicalDeviceShaderClockFeaturesKHR {
	sType StructureType,
	pNext *[],
	shaderSubgroupClock Bool32,
	shaderDeviceClock Bool32,
	shaderDeviceClock Bool32,
}

type SurfaceProtectedCapabilitiesKHR {
	sType StructureType,
	pNext *[],
	supportsProtected Bool32,
	supportsProtected Bool32,
}

type PhysicalDevicePipelineExecutablePropertiesFeaturesKHR {
	sType StructureType,
	pNext *[],
	pipelineExecutableInfo Bool32,
	pipelineExecutableInfo Bool32,
}

type PipelineInfoKHR {
	sType StructureType,
	pNext *[],
	pipeline Pipeline,
	pipeline Pipeline,
}

type PipelineExecutablePropertiesKHR {
	sType StructureType,
	pNext *[],
	stages ShaderStageFlags,
	name byte,
	description byte,
	subgroupSize int,
	subgroupSize int,
}

type PipelineExecutableInfoKHR {
	sType StructureType,
	pNext *[],
	pipeline Pipeline,
	executableIndex int,
	executableIndex int,
}

type PipelineExecutableStatisticKHR {
	sType StructureType,
	pNext *[],
	name byte,
	description byte,
	format PipelineExecutableStatisticFormatKHR,
	value PipelineExecutableStatisticValueKHR,
	value PipelineExecutableStatisticValueKHR,
}

type PipelineExecutableInternalRepresentationKHR {
	sType StructureType,
	pNext *[],
	name byte,
	description byte,
	isText Bool32,
	dataSize size_t,
	pData *[],
	pData *[],
}

type DebugReportCallbackCreateInfoEXT {
	sType StructureType,
	pNext *[],
	flags DebugReportFlagsEXT,
	pfnCallback PFNDebugReportCallbackEXT,
	pUserData *[],
	pUserData *[],
}

type PipelineRasterizationStateRasterizationOrderAMD {
	sType StructureType,
	pNext *[],
	rasterizationOrder RasterizationOrderAMD,
	rasterizationOrder RasterizationOrderAMD,
}

type DebugMarkerObjectNameInfoEXT {
	sType StructureType,
	pNext *[],
	objectType DebugReportObjectTypeEXT,
	object uint64_t,
	pObjectName *byte,
	pObjectName *byte,
}

type DebugMarkerObjectTagInfoEXT {
	sType StructureType,
	pNext *[],
	objectType DebugReportObjectTypeEXT,
	object uint64_t,
	tagName uint64_t,
	tagSize size_t,
	pTag *[],
	pTag *[],
}

type DebugMarkerMarkerInfoEXT {
	sType StructureType,
	pNext *[],
	pMarkerName *byte,
	color real,
	color real,
}

type DedicatedAllocationImageCreateInfoNV {
	sType StructureType,
	pNext *[],
	dedicatedAllocation Bool32,
	dedicatedAllocation Bool32,
}

type DedicatedAllocationBufferCreateInfoNV {
	sType StructureType,
	pNext *[],
	dedicatedAllocation Bool32,
	dedicatedAllocation Bool32,
}

type DedicatedAllocationMemoryAllocateInfoNV {
	sType StructureType,
	pNext *[],
	image Image,
	buffer Buffer,
	buffer Buffer,
}

type PhysicalDeviceTransformFeedbackFeaturesEXT {
	sType StructureType,
	pNext *[],
	transformFeedback Bool32,
	geometryStreams Bool32,
	geometryStreams Bool32,
}

type PhysicalDeviceTransformFeedbackPropertiesEXT {
	sType StructureType,
	pNext *[],
	maxTransformFeedbackStreams int,
	maxTransformFeedbackBuffers int,
	maxTransformFeedbackBufferSize DeviceSize,
	maxTransformFeedbackStreamDataSize int,
	maxTransformFeedbackBufferDataSize int,
	maxTransformFeedbackBufferDataStride int,
	transformFeedbackQueries Bool32,
	transformFeedbackStreamsLinesTriangles Bool32,
	transformFeedbackRasterizationStreamSelect Bool32,
	transformFeedbackDraw Bool32,
	transformFeedbackDraw Bool32,
}

type PipelineRasterizationStateStreamCreateInfoEXT {
	sType StructureType,
	pNext *[],
	flags PipelineRasterizationStateStreamCreateFlagsEXT,
	rasterizationStream int,
	rasterizationStream int,
}

type ImageViewHandleInfoNVX {
	sType StructureType,
	pNext *[],
	imageView ImageView,
	descriptorType DescriptorType,
	sampler Sampler,
	sampler Sampler,
}

type ImageViewAddressPropertiesNVX {
	sType StructureType,
	pNext *[],
	deviceAddress DeviceAddress,
	size DeviceSize,
	size DeviceSize,
}

type TextureLODGatherFormatPropertiesAMD {
	sType StructureType,
	pNext *[],
	supportsTextureGatherLODBiasAMD Bool32,
	supportsTextureGatherLODBiasAMD Bool32,
}

type ShaderResourceUsageAMD {
	numUsedVgprs int,
	numUsedSgprs int,
	ldsSizePerLocalWorkGroup int,
	ldsUsageSizeInBytes size_t,
	scratchMemUsageInBytes size_t,
	scratchMemUsageInBytes size_t,
}

type ShaderStatisticsInfoAMD {
	shaderStageMask ShaderStageFlags,
	resourceUsage ShaderResourceUsageAMD,
	numPhysicalVgprs int,
	numPhysicalSgprs int,
	numAvailableVgprs int,
	numAvailableSgprs int,
	computeWorkGroupSize int,
	computeWorkGroupSize int,
}

type PhysicalDeviceCornerSampledImageFeaturesNV {
	sType StructureType,
	pNext *[],
	cornerSampledImage Bool32,
	cornerSampledImage Bool32,
}

type ExternalImageFormatPropertiesNV {
	imageFormatProperties ImageFormatProperties,
	externalMemoryFeatures ExternalMemoryFeatureFlagsNV,
	exportFromImportedHandleTypes ExternalMemoryHandleTypeFlagsNV,
	compatibleHandleTypes ExternalMemoryHandleTypeFlagsNV,
	compatibleHandleTypes ExternalMemoryHandleTypeFlagsNV,
}

type ExternalMemoryImageCreateInfoNV {
	sType StructureType,
	pNext *[],
	handleTypes ExternalMemoryHandleTypeFlagsNV,
	handleTypes ExternalMemoryHandleTypeFlagsNV,
}

type ExportMemoryAllocateInfoNV {
	sType StructureType,
	pNext *[],
	handleTypes ExternalMemoryHandleTypeFlagsNV,
	handleTypes ExternalMemoryHandleTypeFlagsNV,
}

type ValidationFlagsEXT {
	sType StructureType,
	pNext *[],
	disabledValidationCheckCount int,
	pDisabledValidationChecks *ValidationCheckEXT,
	pDisabledValidationChecks *ValidationCheckEXT,
}

type PhysicalDeviceTextureCompressionASTCHDRFeaturesEXT {
	sType StructureType,
	pNext *[],
	textureCompressionASTC_HDR Bool32,
	textureCompressionASTC_HDR Bool32,
}

type ImageViewASTCDecodeModeEXT {
	sType StructureType,
	pNext *[],
	decodeMode Format,
	decodeMode Format,
}

type PhysicalDeviceASTCDecodeFeaturesEXT {
	sType StructureType,
	pNext *[],
	decodeModeSharedExponent Bool32,
	decodeModeSharedExponent Bool32,
}

type ConditionalRenderingBeginInfoEXT {
	sType StructureType,
	pNext *[],
	buffer Buffer,
	offset DeviceSize,
	flags ConditionalRenderingFlagsEXT,
	flags ConditionalRenderingFlagsEXT,
}

type PhysicalDeviceConditionalRenderingFeaturesEXT {
	sType StructureType,
	pNext *[],
	conditionalRendering Bool32,
	inheritedConditionalRendering Bool32,
	inheritedConditionalRendering Bool32,
}

type CommandBufferInheritanceConditionalRenderingInfoEXT {
	sType StructureType,
	pNext *[],
	conditionalRenderingEnable Bool32,
	conditionalRenderingEnable Bool32,
}

type ViewportWScalingNV {
	xcoeff real,
	ycoeff real,
	ycoeff real,
}

type PipelineViewportWScalingStateCreateInfoNV {
	sType StructureType,
	pNext *[],
	viewportWScalingEnable Bool32,
	viewportCount int,
	pViewportWScalings *ViewportWScalingNV,
	pViewportWScalings *ViewportWScalingNV,
}

type SurfaceCapabilities2EXT {
	sType StructureType,
	pNext *[],
	minImageCount int,
	maxImageCount int,
	currentExtent Extent2D,
	minImageExtent Extent2D,
	maxImageExtent Extent2D,
	maxImageArrayLayers int,
	supportedTransforms SurfaceTransformFlagsKHR,
	currentTransform SurfaceTransformFlagBitsKHR,
	supportedCompositeAlpha CompositeAlphaFlagsKHR,
	supportedUsageFlags ImageUsageFlags,
	supportedSurfaceCounters SurfaceCounterFlagsEXT,
	supportedSurfaceCounters SurfaceCounterFlagsEXT,
}

type DisplayPowerInfoEXT {
	sType StructureType,
	pNext *[],
	powerState DisplayPowerStateEXT,
	powerState DisplayPowerStateEXT,
}

type DeviceEventInfoEXT {
	sType StructureType,
	pNext *[],
	deviceEvent DeviceEventTypeEXT,
	deviceEvent DeviceEventTypeEXT,
}

type DisplayEventInfoEXT {
	sType StructureType,
	pNext *[],
	displayEvent DisplayEventTypeEXT,
	displayEvent DisplayEventTypeEXT,
}

type SwapchainCounterCreateInfoEXT {
	sType StructureType,
	pNext *[],
	surfaceCounters SurfaceCounterFlagsEXT,
	surfaceCounters SurfaceCounterFlagsEXT,
}

type RefreshCycleDurationGOOGLE {
	refreshDuration uint64_t,
	refreshDuration uint64_t,
}

type PastPresentationTimingGOOGLE {
	presentID int,
	desiredPresentTime uint64_t,
	actualPresentTime uint64_t,
	earliestPresentTime uint64_t,
	presentMargin uint64_t,
	presentMargin uint64_t,
}

type PresentTimeGOOGLE {
	presentID int,
	desiredPresentTime uint64_t,
	desiredPresentTime uint64_t,
}

type PresentTimesInfoGOOGLE {
	sType StructureType,
	pNext *[],
	swapchainCount int,
	pTimes *PresentTimeGOOGLE,
	pTimes *PresentTimeGOOGLE,
}

type PhysicalDeviceMultiviewPerViewAttributesPropertiesNVX {
	sType StructureType,
	pNext *[],
	perViewPositionAllComponents Bool32,
	perViewPositionAllComponents Bool32,
}

type ViewportSwizzleNV {
	x ViewportCoordinateSwizzleNV,
	y ViewportCoordinateSwizzleNV,
	z ViewportCoordinateSwizzleNV,
	w ViewportCoordinateSwizzleNV,
	w ViewportCoordinateSwizzleNV,
}

type PipelineViewportSwizzleStateCreateInfoNV {
	sType StructureType,
	pNext *[],
	flags PipelineViewportSwizzleStateCreateFlagsNV,
	viewportCount int,
	pViewportSwizzles *ViewportSwizzleNV,
	pViewportSwizzles *ViewportSwizzleNV,
}

type PhysicalDeviceDiscardRectanglePropertiesEXT {
	sType StructureType,
	pNext *[],
	maxDiscardRectangles int,
	maxDiscardRectangles int,
}

type PipelineDiscardRectangleStateCreateInfoEXT {
	sType StructureType,
	pNext *[],
	flags PipelineDiscardRectangleStateCreateFlagsEXT,
	discardRectangleMode DiscardRectangleModeEXT,
	discardRectangleCount int,
	pDiscardRectangles *Rect2D,
	pDiscardRectangles *Rect2D,
}

type PhysicalDeviceConservativeRasterizationPropertiesEXT {
	sType StructureType,
	pNext *[],
	primitiveOverestimationSize real,
	maxExtraPrimitiveOverestimationSize real,
	extraPrimitiveOverestimationSizeGranularity real,
	primitiveUnderestimation Bool32,
	conservativePointAndLineRasterization Bool32,
	degenerateTrianglesRasterized Bool32,
	degenerateLinesRasterized Bool32,
	fullyCoveredFragmentShaderInputVariable Bool32,
	conservativeRasterizationPostDepthCoverage Bool32,
	conservativeRasterizationPostDepthCoverage Bool32,
}

type PipelineRasterizationConservativeStateCreateInfoEXT {
	sType StructureType,
	pNext *[],
	flags PipelineRasterizationConservativeStateCreateFlagsEXT,
	conservativeRasterizationMode ConservativeRasterizationModeEXT,
	extraPrimitiveOverestimationSize real,
	extraPrimitiveOverestimationSize real,
}

type PhysicalDeviceDepthClipEnableFeaturesEXT {
	sType StructureType,
	pNext *[],
	depthClipEnable Bool32,
	depthClipEnable Bool32,
}

type PipelineRasterizationDepthClipStateCreateInfoEXT {
	sType StructureType,
	pNext *[],
	flags PipelineRasterizationDepthClipStateCreateFlagsEXT,
	depthClipEnable Bool32,
	depthClipEnable Bool32,
}

type XYColorEXT {
	x real,
	y real,
	y real,
}

type HdrMetadataEXT {
	sType StructureType,
	pNext *[],
	displayPrimaryRed XYColorEXT,
	displayPrimaryGreen XYColorEXT,
	displayPrimaryBlue XYColorEXT,
	whitePoint XYColorEXT,
	maxLuminance real,
	minLuminance real,
	maxContentLightLevel real,
	maxFrameAverageLightLevel real,
	maxFrameAverageLightLevel real,
}

type DebugUtilsLabelEXT {
	sType StructureType,
	pNext *[],
	pLabelName *byte,
	color real,
	color real,
}

type DebugUtilsObjectNameInfoEXT {
	sType StructureType,
	pNext *[],
	objectType ObjectType,
	objectHandle uint64_t,
	pObjectName *byte,
	pObjectName *byte,
}

type DebugUtilsMessengerCallbackDataEXT {
	sType StructureType,
	pNext *[],
	flags DebugUtilsMessengerCallbackDataFlagsEXT,
	pMessageIdName *byte,
	messageIdNumber int32_t,
	pMessage *byte,
	queueLabelCount int,
	pQueueLabels *DebugUtilsLabelEXT,
	cmdBufLabelCount int,
	pCmdBufLabels *DebugUtilsLabelEXT,
	objectCount int,
	pObjects *DebugUtilsObjectNameInfoEXT,
	pObjects *DebugUtilsObjectNameInfoEXT,
}

type DebugUtilsObjectTagInfoEXT {
	sType StructureType,
	pNext *[],
	objectType ObjectType,
	objectHandle uint64_t,
	tagName uint64_t,
	tagSize size_t,
	pTag *[],
	pTag *[],
}

type DebugUtilsMessengerCreateInfoEXT {
	sType StructureType,
	pNext *[],
	flags DebugUtilsMessengerCreateFlagsEXT,
	messageSeverity DebugUtilsMessageSeverityFlagsEXT,
	messageType DebugUtilsMessageTypeFlagsEXT,
	pfnUserCallback PFNDebugUtilsMessengerCallbackEXT,
	pUserData *[],
	pUserData *[],
}

type PhysicalDeviceInlineUniformBlockFeaturesEXT {
	sType StructureType,
	pNext *[],
	inlineUniformBlock Bool32,
	descriptorBindingInlineUniformBlockUpdateAfterBind Bool32,
	descriptorBindingInlineUniformBlockUpdateAfterBind Bool32,
}

type PhysicalDeviceInlineUniformBlockPropertiesEXT {
	sType StructureType,
	pNext *[],
	maxInlineUniformBlockSize int,
	maxPerStageDescriptorInlineUniformBlocks int,
	maxPerStageDescriptorUpdateAfterBindInlineUniformBlocks int,
	maxDescriptorSetInlineUniformBlocks int,
	maxDescriptorSetUpdateAfterBindInlineUniformBlocks int,
	maxDescriptorSetUpdateAfterBindInlineUniformBlocks int,
}

type WriteDescriptorSetInlineUniformBlockEXT {
	sType StructureType,
	pNext *[],
	dataSize int,
	pData *[],
	pData *[],
}

type DescriptorPoolInlineUniformBlockCreateInfoEXT {
	sType StructureType,
	pNext *[],
	maxInlineUniformBlockBindings int,
	maxInlineUniformBlockBindings int,
}

type SampleLocationEXT {
	x real,
	y real,
	y real,
}

type SampleLocationsInfoEXT {
	sType StructureType,
	pNext *[],
	sampleLocationsPerPixel SampleCountFlagBits,
	sampleLocationGridSize Extent2D,
	sampleLocationsCount int,
	pSampleLocations *SampleLocationEXT,
	pSampleLocations *SampleLocationEXT,
}

type AttachmentSampleLocationsEXT {
	attachmentIndex int,
	sampleLocationsInfo SampleLocationsInfoEXT,
	sampleLocationsInfo SampleLocationsInfoEXT,
}

type SubpassSampleLocationsEXT {
	subpassIndex int,
	sampleLocationsInfo SampleLocationsInfoEXT,
	sampleLocationsInfo SampleLocationsInfoEXT,
}

type RenderPassSampleLocationsBeginInfoEXT {
	sType StructureType,
	pNext *[],
	attachmentInitialSampleLocationsCount int,
	pAttachmentInitialSampleLocations *AttachmentSampleLocationsEXT,
	postSubpassSampleLocationsCount int,
	pPostSubpassSampleLocations *SubpassSampleLocationsEXT,
	pPostSubpassSampleLocations *SubpassSampleLocationsEXT,
}

type PipelineSampleLocationsStateCreateInfoEXT {
	sType StructureType,
	pNext *[],
	sampleLocationsEnable Bool32,
	sampleLocationsInfo SampleLocationsInfoEXT,
	sampleLocationsInfo SampleLocationsInfoEXT,
}

type PhysicalDeviceSampleLocationsPropertiesEXT {
	sType StructureType,
	pNext *[],
	sampleLocationSampleCounts SampleCountFlags,
	maxSampleLocationGridSize Extent2D,
	sampleLocationCoordinateRange real,
	sampleLocationSubPixelBits int,
	variableSampleLocations Bool32,
	variableSampleLocations Bool32,
}

type MultisamplePropertiesEXT {
	sType StructureType,
	pNext *[],
	maxSampleLocationGridSize Extent2D,
	maxSampleLocationGridSize Extent2D,
}

type PhysicalDeviceBlendOperationAdvancedFeaturesEXT {
	sType StructureType,
	pNext *[],
	advancedBlendCoherentOperations Bool32,
	advancedBlendCoherentOperations Bool32,
}

type PhysicalDeviceBlendOperationAdvancedPropertiesEXT {
	sType StructureType,
	pNext *[],
	advancedBlendMaxColorAttachments int,
	advancedBlendIndependentBlend Bool32,
	advancedBlendNonPremultipliedSrcColor Bool32,
	advancedBlendNonPremultipliedDstColor Bool32,
	advancedBlendCorrelatedOverlap Bool32,
	advancedBlendAllOperations Bool32,
	advancedBlendAllOperations Bool32,
}

type PipelineColorBlendAdvancedStateCreateInfoEXT {
	sType StructureType,
	pNext *[],
	srcPremultiplied Bool32,
	dstPremultiplied Bool32,
	blendOverlap BlendOverlapEXT,
	blendOverlap BlendOverlapEXT,
}

type PipelineCoverageToColorStateCreateInfoNV {
	sType StructureType,
	pNext *[],
	flags PipelineCoverageToColorStateCreateFlagsNV,
	coverageToColorEnable Bool32,
	coverageToColorLocation int,
	coverageToColorLocation int,
}

type PipelineCoverageModulationStateCreateInfoNV {
	sType StructureType,
	pNext *[],
	flags PipelineCoverageModulationStateCreateFlagsNV,
	coverageModulationMode CoverageModulationModeNV,
	coverageModulationTableEnable Bool32,
	coverageModulationTableCount int,
	pCoverageModulationTable *real,
	pCoverageModulationTable *real,
}

type PhysicalDeviceShaderSMBuiltinsPropertiesNV {
	sType StructureType,
	pNext *[],
	shaderSMCount int,
	shaderWarpsPerSM int,
	shaderWarpsPerSM int,
}

type PhysicalDeviceShaderSMBuiltinsFeaturesNV {
	sType StructureType,
	pNext *[],
	shaderSMBuiltins Bool32,
	shaderSMBuiltins Bool32,
}

type DrmFormatModifierPropertiesEXT {
	drmFormatModifier uint64_t,
	drmFormatModifierPlaneCount int,
	drmFormatModifierTilingFeatures FormatFeatureFlags,
	drmFormatModifierTilingFeatures FormatFeatureFlags,
}

type DrmFormatModifierPropertiesListEXT {
	sType StructureType,
	pNext *[],
	drmFormatModifierCount int,
	pDrmFormatModifierProperties *DrmFormatModifierPropertiesEXT,
	pDrmFormatModifierProperties *DrmFormatModifierPropertiesEXT,
}

type PhysicalDeviceImageDrmFormatModifierInfoEXT {
	sType StructureType,
	pNext *[],
	drmFormatModifier uint64_t,
	sharingMode SharingMode,
	queueFamilyIndexCount int,
	pQueueFamilyIndices *int,
	pQueueFamilyIndices *int,
}

type ImageDrmFormatModifierListCreateInfoEXT {
	sType StructureType,
	pNext *[],
	drmFormatModifierCount int,
	pDrmFormatModifiers *uint64_t,
	pDrmFormatModifiers *uint64_t,
}

type ImageDrmFormatModifierExplicitCreateInfoEXT {
	sType StructureType,
	pNext *[],
	drmFormatModifier uint64_t,
	drmFormatModifierPlaneCount int,
	pPlaneLayouts *SubresourceLayout,
	pPlaneLayouts *SubresourceLayout,
}

type ImageDrmFormatModifierPropertiesEXT {
	sType StructureType,
	pNext *[],
	drmFormatModifier uint64_t,
	drmFormatModifier uint64_t,
}

type ValidationCacheCreateInfoEXT {
	sType StructureType,
	pNext *[],
	flags ValidationCacheCreateFlagsEXT,
	initialDataSize size_t,
	pInitialData *[],
	pInitialData *[],
}

type ShaderModuleValidationCacheCreateInfoEXT {
	sType StructureType,
	pNext *[],
	validationCache ValidationCacheEXT,
	validationCache ValidationCacheEXT,
}

type ShadingRatePaletteNV {
	shadingRatePaletteEntryCount int,
	pShadingRatePaletteEntries *ShadingRatePaletteEntryNV,
	pShadingRatePaletteEntries *ShadingRatePaletteEntryNV,
}

type PipelineViewportShadingRateImageStateCreateInfoNV {
	sType StructureType,
	pNext *[],
	shadingRateImageEnable Bool32,
	viewportCount int,
	pShadingRatePalettes *ShadingRatePaletteNV,
	pShadingRatePalettes *ShadingRatePaletteNV,
}

type PhysicalDeviceShadingRateImageFeaturesNV {
	sType StructureType,
	pNext *[],
	shadingRateImage Bool32,
	shadingRateCoarseSampleOrder Bool32,
	shadingRateCoarseSampleOrder Bool32,
}

type PhysicalDeviceShadingRateImagePropertiesNV {
	sType StructureType,
	pNext *[],
	shadingRateTexelSize Extent2D,
	shadingRatePaletteSize int,
	shadingRateMaxCoarseSamples int,
	shadingRateMaxCoarseSamples int,
}

type CoarseSampleLocationNV {
	pixelX int,
	pixelY int,
	sample int,
	sample int,
}

type CoarseSampleOrderCustomNV {
	shadingRate ShadingRatePaletteEntryNV,
	sampleCount int,
	sampleLocationCount int,
	pSampleLocations *CoarseSampleLocationNV,
	pSampleLocations *CoarseSampleLocationNV,
}

type PipelineViewportCoarseSampleOrderStateCreateInfoNV {
	sType StructureType,
	pNext *[],
	sampleOrderType CoarseSampleOrderTypeNV,
	customSampleOrderCount int,
	pCustomSampleOrders *CoarseSampleOrderCustomNV,
	pCustomSampleOrders *CoarseSampleOrderCustomNV,
}

type RayTracingShaderGroupCreateInfoNV {
	sType StructureType,
	pNext *[],
	ty RayTracingShaderGroupTypeKHR,
	generalShader int,
	closestHitShader int,
	anyHitShader int,
	intersectionShader int,
	intersectionShader int,
}

type RayTracingPipelineCreateInfoNV {
	sType StructureType,
	pNext *[],
	flags PipelineCreateFlags,
	stageCount int,
	pStages *PipelineShaderStageCreateInfo,
	groupCount int,
	pGroups *RayTracingShaderGroupCreateInfoNV,
	maxRecursionDepth int,
	layout PipelineLayout,
	basePipelineHandle Pipeline,
	basePipelineIndex int32_t,
	basePipelineIndex int32_t,
}

type GeometryTrianglesNV {
	sType StructureType,
	pNext *[],
	vertexData Buffer,
	vertexOffset DeviceSize,
	vertexCount int,
	vertexStride DeviceSize,
	vertexFormat Format,
	indexData Buffer,
	indexOffset DeviceSize,
	indexCount int,
	indexType IndexType,
	transformData Buffer,
	transformOffset DeviceSize,
	transformOffset DeviceSize,
}

type GeometryAABBNV {
	sType StructureType,
	pNext *[],
	aabbData Buffer,
	numAABBs int,
	stride int,
	offset DeviceSize,
	offset DeviceSize,
}

type GeometryDataNV {
	triangles GeometryTrianglesNV,
	aabbs GeometryAABBNV,
	aabbs GeometryAABBNV,
}

type GeometryNV {
	sType StructureType,
	pNext *[],
	geometryType GeometryTypeKHR,
	geometry GeometryDataNV,
	flags GeometryFlagsKHR,
	flags GeometryFlagsKHR,
}

type AccelerationStructureInfoNV {
	sType StructureType,
	pNext *[],
	ty AccelerationStructureTypeNV,
	flags BuildAccelerationStructureFlagsNV,
	instanceCount int,
	geometryCount int,
	pGeometries *GeometryNV,
	pGeometries *GeometryNV,
}

type AccelerationStructureCreateInfoNV {
	sType StructureType,
	pNext *[],
	compactedSize DeviceSize,
	info AccelerationStructureInfoNV,
	info AccelerationStructureInfoNV,
}

type BindAccelerationStructureMemoryInfoKHR {
	sType StructureType,
	pNext *[],
	accelerationStructure AccelerationStructureKHR,
	memory DeviceMemory,
	memoryOffset DeviceSize,
	deviceIndexCount int,
	pDeviceIndices *int,
	pDeviceIndices *int,
}

type WriteDescriptorSetAccelerationStructureKHR {
	sType StructureType,
	pNext *[],
	accelerationStructureCount int,
	pAccelerationStructures *AccelerationStructureKHR,
	pAccelerationStructures *AccelerationStructureKHR,
}

type AccelerationStructureMemoryRequirementsInfoNV {
	sType StructureType,
	pNext *[],
	ty AccelerationStructureMemoryRequirementsTypeNV,
	accelerationStructure AccelerationStructureNV,
	accelerationStructure AccelerationStructureNV,
}

type PhysicalDeviceRayTracingPropertiesNV {
	sType StructureType,
	pNext *[],
	shaderGroupHandleSize int,
	maxRecursionDepth int,
	maxShaderGroupStride int,
	shaderGroupBaseAlignment int,
	maxGeometryCount uint64_t,
	maxInstanceCount uint64_t,
	maxTriangleCount uint64_t,
	maxDescriptorSetAccelerationStructures int,
	maxDescriptorSetAccelerationStructures int,
}

type TransformMatrixKHR {
	matrix real,
	matrix real,
}

type AabbPositionsKHR {
	minX real,
	minY real,
	minZ real,
	maxX real,
	maxY real,
	maxZ real,
	maxZ real,
}

type AccelerationStructureInstanceKHR {
	transform TransformMatrixKHR,
	instanceCustomIndex int,
	mask int,
	instanceShaderBindingTableRecordOffset int,
	flags GeometryInstanceFlagsKHR,
	accelerationStructureReference uint64_t,
	accelerationStructureReference uint64_t,
}

type PhysicalDeviceRepresentativeFragmentTestFeaturesNV {
	sType StructureType,
	pNext *[],
	representativeFragmentTest Bool32,
	representativeFragmentTest Bool32,
}

type PipelineRepresentativeFragmentTestStateCreateInfoNV {
	sType StructureType,
	pNext *[],
	representativeFragmentTestEnable Bool32,
	representativeFragmentTestEnable Bool32,
}

type PhysicalDeviceImageViewImageFormatInfoEXT {
	sType StructureType,
	pNext *[],
	imageViewType ImageViewType,
	imageViewType ImageViewType,
}

type FilterCubicImageViewImageFormatPropertiesEXT {
	sType StructureType,
	pNext *[],
	filterCubic Bool32,
	filterCubicMinmax Bool32,
	filterCubicMinmax Bool32,
}

type DeviceQueueGlobalPriorityCreateInfoEXT {
	sType StructureType,
	pNext *[],
	globalPriority QueueGlobalPriorityEXT,
	globalPriority QueueGlobalPriorityEXT,
}

type ImportMemoryHostPointerInfoEXT {
	sType StructureType,
	pNext *[],
	handleType ExternalMemoryHandleTypeFlagBits,
	pHostPointer *[],
	pHostPointer *[],
}

type MemoryHostPointerPropertiesEXT {
	sType StructureType,
	pNext *[],
	memoryTypeBits int,
	memoryTypeBits int,
}

type PhysicalDeviceExternalMemoryHostPropertiesEXT {
	sType StructureType,
	pNext *[],
	minImportedHostPointerAlignment DeviceSize,
	minImportedHostPointerAlignment DeviceSize,
}

type PipelineCompilerControlCreateInfoAMD {
	sType StructureType,
	pNext *[],
	compilerControlFlags PipelineCompilerControlFlagsAMD,
	compilerControlFlags PipelineCompilerControlFlagsAMD,
}

type CalibratedTimestampInfoEXT {
	sType StructureType,
	pNext *[],
	timeDomain TimeDomainEXT,
	timeDomain TimeDomainEXT,
}

type PhysicalDeviceShaderCorePropertiesAMD {
	sType StructureType,
	pNext *[],
	shaderEngineCount int,
	shaderArraysPerEngineCount int,
	computeUnitsPerShaderArray int,
	simdPerComputeUnit int,
	wavefrontsPerSimd int,
	wavefrontSize int,
	sgprsPerSimd int,
	minSgprAllocation int,
	maxSgprAllocation int,
	sgprAllocationGranularity int,
	vgprsPerSimd int,
	minVgprAllocation int,
	maxVgprAllocation int,
	vgprAllocationGranularity int,
	vgprAllocationGranularity int,
}

type DeviceMemoryOverallocationCreateInfoAMD {
	sType StructureType,
	pNext *[],
	overallocationBehavior MemoryOverallocationBehaviorAMD,
	overallocationBehavior MemoryOverallocationBehaviorAMD,
}

type PhysicalDeviceVertexAttributeDivisorPropertiesEXT {
	sType StructureType,
	pNext *[],
	maxVertexAttribDivisor int,
	maxVertexAttribDivisor int,
}

type VertexInputBindingDivisorDescriptionEXT {
	binding int,
	divisor int,
	divisor int,
}

type PipelineVertexInputDivisorStateCreateInfoEXT {
	sType StructureType,
	pNext *[],
	vertexBindingDivisorCount int,
	pVertexBindingDivisors *VertexInputBindingDivisorDescriptionEXT,
	pVertexBindingDivisors *VertexInputBindingDivisorDescriptionEXT,
}

type PhysicalDeviceVertexAttributeDivisorFeaturesEXT {
	sType StructureType,
	pNext *[],
	vertexAttributeInstanceRateDivisor Bool32,
	vertexAttributeInstanceRateZeroDivisor Bool32,
	vertexAttributeInstanceRateZeroDivisor Bool32,
}

type PipelineCreationFeedbackEXT {
	flags PipelineCreationFeedbackFlagsEXT,
	duration uint64_t,
	duration uint64_t,
}

type PipelineCreationFeedbackCreateInfoEXT {
	sType StructureType,
	pNext *[],
	pPipelineCreationFeedback *PipelineCreationFeedbackEXT,
	pipelineStageCreationFeedbackCount int,
	pPipelineStageCreationFeedbacks *PipelineCreationFeedbackEXT,
	pPipelineStageCreationFeedbacks *PipelineCreationFeedbackEXT,
}

type PhysicalDeviceComputeShaderDerivativesFeaturesNV {
	sType StructureType,
	pNext *[],
	computeDerivativeGroupQuads Bool32,
	computeDerivativeGroupLinear Bool32,
	computeDerivativeGroupLinear Bool32,
}

type PhysicalDeviceMeshShaderFeaturesNV {
	sType StructureType,
	pNext *[],
	taskShader Bool32,
	meshShader Bool32,
	meshShader Bool32,
}

type PhysicalDeviceMeshShaderPropertiesNV {
	sType StructureType,
	pNext *[],
	maxDrawMeshTasksCount int,
	maxTaskWorkGroupInvocations int,
	maxTaskWorkGroupSize int,
	maxTaskTotalMemorySize int,
	maxTaskOutputCount int,
	maxMeshWorkGroupInvocations int,
	maxMeshWorkGroupSize int,
	maxMeshTotalMemorySize int,
	maxMeshOutputVertices int,
	maxMeshOutputPrimitives int,
	maxMeshMultiviewViewCount int,
	meshOutputPerVertexGranularity int,
	meshOutputPerPrimitiveGranularity int,
	meshOutputPerPrimitiveGranularity int,
}

type DrawMeshTasksIndirectCommandNV {
	taskCount int,
	firstTask int,
	firstTask int,
}

type PhysicalDeviceFragmentShaderBarycentricFeaturesNV {
	sType StructureType,
	pNext *[],
	fragmentShaderBarycentric Bool32,
	fragmentShaderBarycentric Bool32,
}

type PhysicalDeviceShaderImageFootprintFeaturesNV {
	sType StructureType,
	pNext *[],
	imageFootprint Bool32,
	imageFootprint Bool32,
}

type PipelineViewportExclusiveScissorStateCreateInfoNV {
	sType StructureType,
	pNext *[],
	exclusiveScissorCount int,
	pExclusiveScissors *Rect2D,
	pExclusiveScissors *Rect2D,
}

type PhysicalDeviceExclusiveScissorFeaturesNV {
	sType StructureType,
	pNext *[],
	exclusiveScissor Bool32,
	exclusiveScissor Bool32,
}

type QueueFamilyCheckpointPropertiesNV {
	sType StructureType,
	pNext *[],
	checkpointExecutionStageMask PipelineStageFlags,
	checkpointExecutionStageMask PipelineStageFlags,
}

type CheckpointDataNV {
	sType StructureType,
	pNext *[],
	stage PipelineStageFlagBits,
	pCheckpointMarker *[],
	pCheckpointMarker *[],
}

type PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL {
	sType StructureType,
	pNext *[],
	shaderIntegerFunctions2 Bool32,
	shaderIntegerFunctions2 Bool32,
}

type PerformanceValueINTEL {
	ty PerformanceValueTypeINTEL,
	data PerformanceValueDataINTEL,
	data PerformanceValueDataINTEL,
}

type InitializePerformanceApiInfoINTEL {
	sType StructureType,
	pNext *[],
	pUserData *[],
	pUserData *[],
}

type QueryPoolPerformanceQueryCreateInfoINTEL {
	sType StructureType,
	pNext *[],
	performanceCountersSampling QueryPoolSamplingModeINTEL,
	performanceCountersSampling QueryPoolSamplingModeINTEL,
}

type PerformanceMarkerInfoINTEL {
	sType StructureType,
	pNext *[],
	marker uint64_t,
	marker uint64_t,
}

type PerformanceStreamMarkerInfoINTEL {
	sType StructureType,
	pNext *[],
	marker int,
	marker int,
}

type PerformanceOverrideInfoINTEL {
	sType StructureType,
	pNext *[],
	ty PerformanceOverrideTypeINTEL,
	enable Bool32,
	parameter uint64_t,
	parameter uint64_t,
}

type PerformanceConfigurationAcquireInfoINTEL {
	sType StructureType,
	pNext *[],
	ty PerformanceConfigurationTypeINTEL,
	ty PerformanceConfigurationTypeINTEL,
}

type PhysicalDevicePCIBusInfoPropertiesEXT {
	sType StructureType,
	pNext *[],
	pciDomain int,
	pciBus int,
	pciDevice int,
	pciFunction int,
	pciFunction int,
}

type DisplayNativeHdrSurfaceCapabilitiesAMD {
	sType StructureType,
	pNext *[],
	localDimmingSupport Bool32,
	localDimmingSupport Bool32,
}

type SwapchainDisplayNativeHdrCreateInfoAMD {
	sType StructureType,
	pNext *[],
	localDimmingEnable Bool32,
	localDimmingEnable Bool32,
}

type PhysicalDeviceFragmentDensityMapFeaturesEXT {
	sType StructureType,
	pNext *[],
	fragmentDensityMap Bool32,
	fragmentDensityMapDynamic Bool32,
	fragmentDensityMapNonSubsampledImages Bool32,
	fragmentDensityMapNonSubsampledImages Bool32,
}

type PhysicalDeviceFragmentDensityMapPropertiesEXT {
	sType StructureType,
	pNext *[],
	minFragmentDensityTexelSize Extent2D,
	maxFragmentDensityTexelSize Extent2D,
	fragmentDensityInvocations Bool32,
	fragmentDensityInvocations Bool32,
}

type RenderPassFragmentDensityMapCreateInfoEXT {
	sType StructureType,
	pNext *[],
	fragmentDensityMapAttachment AttachmentReference,
	fragmentDensityMapAttachment AttachmentReference,
}

type PhysicalDeviceSubgroupSizeControlFeaturesEXT {
	sType StructureType,
	pNext *[],
	subgroupSizeControl Bool32,
	computeFullSubgroups Bool32,
	computeFullSubgroups Bool32,
}

type PhysicalDeviceSubgroupSizeControlPropertiesEXT {
	sType StructureType,
	pNext *[],
	minSubgroupSize int,
	maxSubgroupSize int,
	maxComputeWorkgroupSubgroups int,
	requiredSubgroupSizeStages ShaderStageFlags,
	requiredSubgroupSizeStages ShaderStageFlags,
}

type PipelineShaderStageRequiredSubgroupSizeCreateInfoEXT {
	sType StructureType,
	pNext *[],
	requiredSubgroupSize int,
	requiredSubgroupSize int,
}

type PhysicalDeviceShaderCoreProperties2AMD {
	sType StructureType,
	pNext *[],
	shaderCoreFeatures ShaderCorePropertiesFlagsAMD,
	activeComputeUnitCount int,
	activeComputeUnitCount int,
}

type PhysicalDeviceCoherentMemoryFeaturesAMD {
	sType StructureType,
	pNext *[],
	deviceCoherentMemory Bool32,
	deviceCoherentMemory Bool32,
}

type PhysicalDeviceMemoryBudgetPropertiesEXT {
	sType StructureType,
	pNext *[],
	heapBudget DeviceSize,
	heapUsage DeviceSize,
	heapUsage DeviceSize,
}

type PhysicalDeviceMemoryPriorityFeaturesEXT {
	sType StructureType,
	pNext *[],
	memoryPriority Bool32,
	memoryPriority Bool32,
}

type MemoryPriorityAllocateInfoEXT {
	sType StructureType,
	pNext *[],
	priority real,
	priority real,
}

type PhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV {
	sType StructureType,
	pNext *[],
	dedicatedAllocationImageAliasing Bool32,
	dedicatedAllocationImageAliasing Bool32,
}

type PhysicalDeviceBufferDeviceAddressFeaturesEXT {
	sType StructureType,
	pNext *[],
	bufferDeviceAddress Bool32,
	bufferDeviceAddressCaptureReplay Bool32,
	bufferDeviceAddressMultiDevice Bool32,
	bufferDeviceAddressMultiDevice Bool32,
}

type BufferDeviceAddressCreateInfoEXT {
	sType StructureType,
	pNext *[],
	deviceAddress DeviceAddress,
	deviceAddress DeviceAddress,
}

type PhysicalDeviceToolPropertiesEXT {
	sType StructureType,
	pNext *[],
	name byte,
	version byte,
	purposes ToolPurposeFlagsEXT,
	description byte,
	layer byte,
	layer byte,
}

type ValidationFeaturesEXT {
	sType StructureType,
	pNext *[],
	enabledValidationFeatureCount int,
	pEnabledValidationFeatures *ValidationFeatureEnableEXT,
	disabledValidationFeatureCount int,
	pDisabledValidationFeatures *ValidationFeatureDisableEXT,
	pDisabledValidationFeatures *ValidationFeatureDisableEXT,
}

type CooperativeMatrixPropertiesNV {
	sType StructureType,
	pNext *[],
	MSize int,
	NSize int,
	KSize int,
	AType ComponentTypeNV,
	BType ComponentTypeNV,
	CType ComponentTypeNV,
	DType ComponentTypeNV,
	scope ScopeNV,
	scope ScopeNV,
}

type PhysicalDeviceCooperativeMatrixFeaturesNV {
	sType StructureType,
	pNext *[],
	cooperativeMatrix Bool32,
	cooperativeMatrixRobustBufferAccess Bool32,
	cooperativeMatrixRobustBufferAccess Bool32,
}

type PhysicalDeviceCooperativeMatrixPropertiesNV {
	sType StructureType,
	pNext *[],
	cooperativeMatrixSupportedStages ShaderStageFlags,
	cooperativeMatrixSupportedStages ShaderStageFlags,
}

type PhysicalDeviceCoverageReductionModeFeaturesNV {
	sType StructureType,
	pNext *[],
	coverageReductionMode Bool32,
	coverageReductionMode Bool32,
}

type PipelineCoverageReductionStateCreateInfoNV {
	sType StructureType,
	pNext *[],
	flags PipelineCoverageReductionStateCreateFlagsNV,
	coverageReductionMode CoverageReductionModeNV,
	coverageReductionMode CoverageReductionModeNV,
}

type FramebufferMixedSamplesCombinationNV {
	sType StructureType,
	pNext *[],
	coverageReductionMode CoverageReductionModeNV,
	rasterizationSamples SampleCountFlagBits,
	depthStencilSamples SampleCountFlags,
	colorSamples SampleCountFlags,
	colorSamples SampleCountFlags,
}

type PhysicalDeviceFragmentShaderInterlockFeaturesEXT {
	sType StructureType,
	pNext *[],
	fragmentShaderSampleInterlock Bool32,
	fragmentShaderPixelInterlock Bool32,
	fragmentShaderShadingRateInterlock Bool32,
	fragmentShaderShadingRateInterlock Bool32,
}

type PhysicalDeviceYcbcrImageArraysFeaturesEXT {
	sType StructureType,
	pNext *[],
	ycbcrImageArrays Bool32,
	ycbcrImageArrays Bool32,
}

type HeadlessSurfaceCreateInfoEXT {
	sType StructureType,
	pNext *[],
	flags HeadlessSurfaceCreateFlagsEXT,
	flags HeadlessSurfaceCreateFlagsEXT,
}

type PhysicalDeviceLineRasterizationFeaturesEXT {
	sType StructureType,
	pNext *[],
	rectangularLines Bool32,
	bresenhamLines Bool32,
	smoothLines Bool32,
	stippledRectangularLines Bool32,
	stippledBresenhamLines Bool32,
	stippledSmoothLines Bool32,
	stippledSmoothLines Bool32,
}

type PhysicalDeviceLineRasterizationPropertiesEXT {
	sType StructureType,
	pNext *[],
	lineSubPixelPrecisionBits int,
	lineSubPixelPrecisionBits int,
}

type PipelineRasterizationLineStateCreateInfoEXT {
	sType StructureType,
	pNext *[],
	lineRasterizationMode LineRasterizationModeEXT,
	stippledLineEnable Bool32,
	lineStippleFactor int,
	lineStipplePattern uint16_t,
	lineStipplePattern uint16_t,
}

type PhysicalDeviceIndexTypeUint8FeaturesEXT {
	sType StructureType,
	pNext *[],
	indexTypeUint8 Bool32,
	indexTypeUint8 Bool32,
}

type PhysicalDeviceShaderDemoteToHelperInvocationFeaturesEXT {
	sType StructureType,
	pNext *[],
	shaderDemoteToHelperInvocation Bool32,
	shaderDemoteToHelperInvocation Bool32,
}

type PhysicalDeviceDeviceGeneratedCommandsPropertiesNV {
	sType StructureType,
	pNext *[],
	maxGraphicsShaderGroupCount int,
	maxIndirectSequenceCount int,
	maxIndirectCommandsTokenCount int,
	maxIndirectCommandsStreamCount int,
	maxIndirectCommandsTokenOffset int,
	maxIndirectCommandsStreamStride int,
	minSequencesCountBufferOffsetAlignment int,
	minSequencesIndexBufferOffsetAlignment int,
	minIndirectCommandsBufferOffsetAlignment int,
	minIndirectCommandsBufferOffsetAlignment int,
}

type PhysicalDeviceDeviceGeneratedCommandsFeaturesNV {
	sType StructureType,
	pNext *[],
	deviceGeneratedCommands Bool32,
	deviceGeneratedCommands Bool32,
}

type GraphicsShaderGroupCreateInfoNV {
	sType StructureType,
	pNext *[],
	stageCount int,
	pStages *PipelineShaderStageCreateInfo,
	pVertexInputState *PipelineVertexInputStateCreateInfo,
	pTessellationState *PipelineTessellationStateCreateInfo,
	pTessellationState *PipelineTessellationStateCreateInfo,
}

type GraphicsPipelineShaderGroupsCreateInfoNV {
	sType StructureType,
	pNext *[],
	groupCount int,
	pGroups *GraphicsShaderGroupCreateInfoNV,
	pipelineCount int,
	pPipelines *Pipeline,
	pPipelines *Pipeline,
}

type BindShaderGroupIndirectCommandNV {
	groupIndex int,
	groupIndex int,
}

type BindIndexBufferIndirectCommandNV {
	bufferAddress DeviceAddress,
	size int,
	indexType IndexType,
	indexType IndexType,
}

type BindVertexBufferIndirectCommandNV {
	bufferAddress DeviceAddress,
	size int,
	stride int,
	stride int,
}

type SetStateFlagsIndirectCommandNV {
	data int,
	data int,
}

type IndirectCommandsStreamNV {
	buffer Buffer,
	offset DeviceSize,
	offset DeviceSize,
}

type IndirectCommandsLayoutTokenNV {
	sType StructureType,
	pNext *[],
	tokenType IndirectCommandsTokenTypeNV,
	stream int,
	offset int,
	vertexBindingUnit int,
	vertexDynamicStride Bool32,
	pushconstantPipelineLayout PipelineLayout,
	pushconstantShaderStageFlags ShaderStageFlags,
	pushconstantOffset int,
	pushconstantSize int,
	indirectStateFlags IndirectStateFlagsNV,
	indexTypeCount int,
	pIndexTypes *IndexType,
	pIndexTypeValues *int,
	pIndexTypeValues *int,
}

type IndirectCommandsLayoutCreateInfoNV {
	sType StructureType,
	pNext *[],
	flags IndirectCommandsLayoutUsageFlagsNV,
	pipelineBindPoint PipelineBindPoint,
	tokenCount int,
	pTokens *IndirectCommandsLayoutTokenNV,
	streamCount int,
	pStreamStrides *int,
	pStreamStrides *int,
}

type GeneratedCommandsInfoNV {
	sType StructureType,
	pNext *[],
	pipelineBindPoint PipelineBindPoint,
	pipeline Pipeline,
	indirectCommandsLayout IndirectCommandsLayoutNV,
	streamCount int,
	pStreams *IndirectCommandsStreamNV,
	sequencesCount int,
	preprocessBuffer Buffer,
	preprocessOffset DeviceSize,
	preprocessSize DeviceSize,
	sequencesCountBuffer Buffer,
	sequencesCountOffset DeviceSize,
	sequencesIndexBuffer Buffer,
	sequencesIndexOffset DeviceSize,
	sequencesIndexOffset DeviceSize,
}

type GeneratedCommandsMemoryRequirementsInfoNV {
	sType StructureType,
	pNext *[],
	pipelineBindPoint PipelineBindPoint,
	pipeline Pipeline,
	indirectCommandsLayout IndirectCommandsLayoutNV,
	maxSequencesCount int,
	maxSequencesCount int,
}

type PhysicalDeviceTexelBufferAlignmentFeaturesEXT {
	sType StructureType,
	pNext *[],
	texelBufferAlignment Bool32,
	texelBufferAlignment Bool32,
}

type PhysicalDeviceTexelBufferAlignmentPropertiesEXT {
	sType StructureType,
	pNext *[],
	storageTexelBufferOffsetAlignmentBytes DeviceSize,
	storageTexelBufferOffsetSingleTexelAlignment Bool32,
	uniformTexelBufferOffsetAlignmentBytes DeviceSize,
	uniformTexelBufferOffsetSingleTexelAlignment Bool32,
	uniformTexelBufferOffsetSingleTexelAlignment Bool32,
}

type RenderPassTransformBeginInfoQCOM {
	sType StructureType,
	pNext *[],
	transform SurfaceTransformFlagBitsKHR,
	transform SurfaceTransformFlagBitsKHR,
}

type CommandBufferInheritanceRenderPassTransformInfoQCOM {
	sType StructureType,
	pNext *[],
	transform SurfaceTransformFlagBitsKHR,
	renderArea Rect2D,
	renderArea Rect2D,
}

type PhysicalDeviceRobustness2FeaturesEXT {
	sType StructureType,
	pNext *[],
	robustBufferAccess2 Bool32,
	robustImageAccess2 Bool32,
	nullDescriptor Bool32,
	nullDescriptor Bool32,
}

type PhysicalDeviceRobustness2PropertiesEXT {
	sType StructureType,
	pNext *[],
	robustStorageBufferAccessSizeAlignment DeviceSize,
	robustUniformBufferAccessSizeAlignment DeviceSize,
	robustUniformBufferAccessSizeAlignment DeviceSize,
}

type SamplerCustomBorderColorCreateInfoEXT {
	sType StructureType,
	pNext *[],
	customBorderColor ClearColorValue,
	format Format,
	format Format,
}

type PhysicalDeviceCustomBorderColorPropertiesEXT {
	sType StructureType,
	pNext *[],
	maxCustomBorderColorSamplers int,
	maxCustomBorderColorSamplers int,
}

type PhysicalDeviceCustomBorderColorFeaturesEXT {
	sType StructureType,
	pNext *[],
	customBorderColors Bool32,
	customBorderColorWithoutFormat Bool32,
	customBorderColorWithoutFormat Bool32,
}

type PhysicalDevicePrivateDataFeaturesEXT {
	sType StructureType,
	pNext *[],
	privateData Bool32,
	privateData Bool32,
}

type DevicePrivateDataCreateInfoEXT {
	sType StructureType,
	pNext *[],
	privateDataSlotRequestCount int,
	privateDataSlotRequestCount int,
}

type PrivateDataSlotCreateInfoEXT {
	sType StructureType,
	pNext *[],
	flags PrivateDataSlotCreateFlagsEXT,
	flags PrivateDataSlotCreateFlagsEXT,
}

type PhysicalDevicePipelineCreationCacheControlFeaturesEXT {
	sType StructureType,
	pNext *[],
	pipelineCreationCacheControl Bool32,
	pipelineCreationCacheControl Bool32,
}

type PhysicalDeviceDiagnosticsConfigFeaturesNV {
	sType StructureType,
	pNext *[],
	diagnosticsConfig Bool32,
	diagnosticsConfig Bool32,
}

type DeviceDiagnosticsConfigCreateInfoNV {
	sType StructureType,
	pNext *[],
	flags DeviceDiagnosticsConfigFlagsNV,
	flags DeviceDiagnosticsConfigFlagsNV,
}

