alias uint Bool32
alias ulong DeviceAddress
alias ulong DeviceSize
alias uint Flags
alias uint SampleMask
alias long Buffer
alias long Image
alias long Instance
alias long PhysicalDevice
alias long Device
alias long Queue
alias long Semaphore
alias long CommandBuffer
alias long Fence
alias long DeviceMemory
alias long Event
alias long QueryPool
alias long BufferView
alias long ImageView
alias long ShaderModule
alias long PipelineCache
alias long PipelineLayout
alias long Pipeline
alias long RenderPass
alias long DescriptorSetLayout
alias long Sampler
alias long DescriptorSet
alias long DescriptorPool
alias long Framebuffer
alias long CommandPool
enum Result {}
enum StructureType {}
enum ImageLayout {}
enum ObjectType {}
enum VendorId {}
enum PipelineCacheHeaderVersion {}
enum SystemAllocationScope {}
enum InternalAllocationType {}
enum Format {}
enum ImageTiling {}
enum ImageType {}
enum PhysicalDeviceType {}
enum QueryType {}
enum SharingMode {}
enum ComponentSwizzle {}
enum ImageViewType {}
enum BlendFactor {}
enum BlendOp {}
enum CompareOp {}
enum DynamicState {}
enum FrontFace {}
enum VertexInputRate {}
enum PrimitiveTopology {}
enum PolygonMode {}
enum StencilOp {}
enum LogicOp {}
enum BorderColor {}
enum Filter {}
enum SamplerAddressMode {}
enum SamplerMipmapMode {}
enum DescriptorType {}
enum AttachmentLoadOp {}
enum AttachmentStoreOp {}
enum PipelineBindPoint {}
enum CommandBufferLevel {}
enum IndexType {}
enum SubpassContents {}
enum AccessFlagBits {}
alias Flags AccessFlags
enum ImageAspectFlagBits {}
alias Flags ImageAspectFlags
enum FormatFeatureFlagBits {}
alias Flags FormatFeatureFlags
enum ImageCreateFlagBits {}
alias Flags ImageCreateFlags
enum SampleCountFlagBits {}
alias Flags SampleCountFlags
enum ImageUsageFlagBits {}
alias Flags ImageUsageFlags
alias Flags InstanceCreateFlags
enum MemoryHeapFlagBits {}
alias Flags MemoryHeapFlags
enum MemoryPropertyFlagBits {}
alias Flags MemoryPropertyFlags
enum QueueFlagBits {}
alias Flags QueueFlags
alias Flags DeviceCreateFlags
enum DeviceQueueCreateFlagBits {}
alias Flags DeviceQueueCreateFlags
enum PipelineStageFlagBits {}
alias Flags PipelineStageFlags
alias Flags MemoryMapFlags
enum SparseMemoryBindFlagBits {}
alias Flags SparseMemoryBindFlags
enum SparseImageFormatFlagBits {}
alias Flags SparseImageFormatFlags
enum FenceCreateFlagBits {}
alias Flags FenceCreateFlags
alias Flags SemaphoreCreateFlags
alias Flags EventCreateFlags
enum QueryPipelineStatisticFlagBits {}
alias Flags QueryPipelineStatisticFlags
alias Flags QueryPoolCreateFlags
enum QueryResultFlagBits {}
alias Flags QueryResultFlags
enum BufferCreateFlagBits {}
alias Flags BufferCreateFlags
enum BufferUsageFlagBits {}
alias Flags BufferUsageFlags
alias Flags BufferViewCreateFlags
enum ImageViewCreateFlagBits {}
alias Flags ImageViewCreateFlags
enum ShaderModuleCreateFlagBits {}
alias Flags ShaderModuleCreateFlags
enum PipelineCacheCreateFlagBits {}
alias Flags PipelineCacheCreateFlags
enum ColorComponentFlagBits {}
alias Flags ColorComponentFlags
enum PipelineCreateFlagBits {}
alias Flags PipelineCreateFlags
enum PipelineShaderStageCreateFlagBits {}
alias Flags PipelineShaderStageCreateFlags
enum ShaderStageFlagBits {}
enum CullModeFlagBits {}
alias Flags CullModeFlags
alias Flags PipelineVertexInputStateCreateFlags
alias Flags PipelineInputAssemblyStateCreateFlags
alias Flags PipelineTessellationStateCreateFlags
alias Flags PipelineViewportStateCreateFlags
alias Flags PipelineRasterizationStateCreateFlags
alias Flags PipelineMultisampleStateCreateFlags
alias Flags PipelineDepthStencilStateCreateFlags
alias Flags PipelineColorBlendStateCreateFlags
alias Flags PipelineDynamicStateCreateFlags
alias Flags PipelineLayoutCreateFlags
alias Flags ShaderStageFlags
enum SamplerCreateFlagBits {}
alias Flags SamplerCreateFlags
enum DescriptorPoolCreateFlagBits {}
alias Flags DescriptorPoolCreateFlags
alias Flags DescriptorPoolResetFlags
enum DescriptorSetLayoutCreateFlagBits {}
alias Flags DescriptorSetLayoutCreateFlags
enum AttachmentDescriptionFlagBits {}
alias Flags AttachmentDescriptionFlags
enum DependencyFlagBits {}
alias Flags DependencyFlags
enum FramebufferCreateFlagBits {}
alias Flags FramebufferCreateFlags
enum RenderPassCreateFlagBits {}
alias Flags RenderPassCreateFlags
enum SubpassDescriptionFlagBits {}
alias Flags SubpassDescriptionFlags
enum CommandPoolCreateFlagBits {}
alias Flags CommandPoolCreateFlags
enum CommandPoolResetFlagBits {}
alias Flags CommandPoolResetFlags
enum CommandBufferUsageFlagBits {}
alias Flags CommandBufferUsageFlags
enum QueryControlFlagBits {}
alias Flags QueryControlFlags
enum CommandBufferResetFlagBits {}
alias Flags CommandBufferResetFlags
enum StencilFaceFlagBits {}
alias Flags StencilFaceFlags
alias () PFNAllocationFunction
alias () PFNFreeFunction
alias () PFNInternalAllocationNotification
alias () PFNInternalFreeNotification
alias () PFNReallocationFunction
alias () PFNVoidFunction
alias () PFNCreateInstance
alias () PFNDestroyInstance
alias () PFNEnumeratePhysicalDevices
alias () PFNGetPhysicalDeviceFeatures
alias () PFNGetPhysicalDeviceFormatProperties
alias () PFNGetPhysicalDeviceImageFormatProperties
alias () PFNGetPhysicalDeviceProperties
alias () PFNGetPhysicalDeviceQueueFamilyProperties
alias () PFNGetPhysicalDeviceMemoryProperties
alias () PFNGetInstanceProcAddr
alias () PFNGetDeviceProcAddr
alias () PFNCreateDevice
alias () PFNDestroyDevice
alias () PFNEnumerateInstanceExtensionProperties
alias () PFNEnumerateDeviceExtensionProperties
alias () PFNEnumerateInstanceLayerProperties
alias () PFNEnumerateDeviceLayerProperties
alias () PFNGetDeviceQueue
alias () PFNQueueSubmit
alias () PFNQueueWaitIdle
alias () PFNDeviceWaitIdle
alias () PFNAllocateMemory
alias () PFNFreeMemory
alias () PFNMapMemory
alias () PFNUnmapMemory
alias () PFNFlushMappedMemoryRanges
alias () PFNInvalidateMappedMemoryRanges
alias () PFNGetDeviceMemoryCommitment
alias () PFNBindBufferMemory
alias () PFNBindImageMemory
alias () PFNGetBufferMemoryRequirements
alias () PFNGetImageMemoryRequirements
alias () PFNGetImageSparseMemoryRequirements
alias () PFNGetPhysicalDeviceSparseImageFormatProperties
alias () PFNQueueBindSparse
alias () PFNCreateFence
alias () PFNDestroyFence
alias () PFNResetFences
alias () PFNGetFenceStatus
alias () PFNWaitForFences
alias () PFNCreateSemaphore
alias () PFNDestroySemaphore
alias () PFNCreateEvent
alias () PFNDestroyEvent
alias () PFNGetEventStatus
alias () PFNSetEvent
alias () PFNResetEvent
alias () PFNCreateQueryPool
alias () PFNDestroyQueryPool
alias () PFNGetQueryPoolResults
alias () PFNCreateBuffer
alias () PFNDestroyBuffer
alias () PFNCreateBufferView
alias () PFNDestroyBufferView
alias () PFNCreateImage
alias () PFNDestroyImage
alias () PFNGetImageSubresourceLayout
alias () PFNCreateImageView
alias () PFNDestroyImageView
alias () PFNCreateShaderModule
alias () PFNDestroyShaderModule
alias () PFNCreatePipelineCache
alias () PFNDestroyPipelineCache
alias () PFNGetPipelineCacheData
alias () PFNMergePipelineCaches
alias () PFNCreateGraphicsPipelines
alias () PFNCreateComputePipelines
alias () PFNDestroyPipeline
alias () PFNCreatePipelineLayout
alias () PFNDestroyPipelineLayout
alias () PFNCreateSampler
alias () PFNDestroySampler
alias () PFNCreateDescriptorSetLayout
alias () PFNDestroyDescriptorSetLayout
alias () PFNCreateDescriptorPool
alias () PFNDestroyDescriptorPool
alias () PFNResetDescriptorPool
alias () PFNAllocateDescriptorSets
alias () PFNFreeDescriptorSets
alias () PFNUpdateDescriptorSets
alias () PFNCreateFramebuffer
alias () PFNDestroyFramebuffer
alias () PFNCreateRenderPass
alias () PFNDestroyRenderPass
alias () PFNGetRenderAreaGranularity
alias () PFNCreateCommandPool
alias () PFNDestroyCommandPool
alias () PFNResetCommandPool
alias () PFNAllocateCommandBuffers
alias () PFNFreeCommandBuffers
alias () PFNBeginCommandBuffer
alias () PFNEndCommandBuffer
alias () PFNResetCommandBuffer
alias () PFNCmdBindPipeline
alias () PFNCmdSetViewport
alias () PFNCmdSetScissor
alias () PFNCmdSetLineWidth
alias () PFNCmdSetDepthBias
alias () PFNCmdSetBlendConstants
alias () PFNCmdSetDepthBounds
alias () PFNCmdSetStencilCompareMask
alias () PFNCmdSetStencilWriteMask
alias () PFNCmdSetStencilReference
alias () PFNCmdBindDescriptorSets
alias () PFNCmdBindIndexBuffer
alias () PFNCmdBindVertexBuffers
alias () PFNCmdDraw
alias () PFNCmdDrawIndexed
alias () PFNCmdDrawIndirect
alias () PFNCmdDrawIndexedIndirect
alias () PFNCmdDispatch
alias () PFNCmdDispatchIndirect
alias () PFNCmdCopyBuffer
alias () PFNCmdCopyImage
alias () PFNCmdBlitImage
alias () PFNCmdCopyBufferToImage
alias () PFNCmdCopyImageToBuffer
alias () PFNCmdUpdateBuffer
alias () PFNCmdFillBuffer
alias () PFNCmdClearColorImage
alias () PFNCmdClearDepthStencilImage
alias () PFNCmdClearAttachments
alias () PFNCmdResolveImage
alias () PFNCmdSetEvent
alias () PFNCmdResetEvent
alias () PFNCmdWaitEvents
alias () PFNCmdPipelineBarrier
alias () PFNCmdBeginQuery
alias () PFNCmdEndQuery
alias () PFNCmdResetQueryPool
alias () PFNCmdWriteTimestamp
alias () PFNCmdCopyQueryPoolResults
alias () PFNCmdPushConstants
alias () PFNCmdBeginRenderPass
alias () PFNCmdNextSubpass
alias () PFNCmdEndRenderPass
alias () PFNCmdExecuteCommands
alias long SamplerYcbcrConversion
alias long DescriptorUpdateTemplate
enum PointClippingBehavior {}
enum TessellationDomainOrigin {}
enum SamplerYcbcrModelConversion {}
enum SamplerYcbcrRange {}
enum ChromaLocation {}
enum DescriptorUpdateTemplateType {}
enum SubgroupFeatureFlagBits {}
alias Flags SubgroupFeatureFlags
enum PeerMemoryFeatureFlagBits {}
alias Flags PeerMemoryFeatureFlags
enum MemoryAllocateFlagBits {}
alias Flags MemoryAllocateFlags
alias Flags CommandPoolTrimFlags
alias Flags DescriptorUpdateTemplateCreateFlags
enum ExternalMemoryHandleTypeFlagBits {}
alias Flags ExternalMemoryHandleTypeFlags
enum ExternalMemoryFeatureFlagBits {}
alias Flags ExternalMemoryFeatureFlags
enum ExternalFenceHandleTypeFlagBits {}
alias Flags ExternalFenceHandleTypeFlags
enum ExternalFenceFeatureFlagBits {}
alias Flags ExternalFenceFeatureFlags
enum FenceImportFlagBits {}
alias Flags FenceImportFlags
enum SemaphoreImportFlagBits {}
alias Flags SemaphoreImportFlags
enum ExternalSemaphoreHandleTypeFlagBits {}
alias Flags ExternalSemaphoreHandleTypeFlags
enum ExternalSemaphoreFeatureFlagBits {}
alias Flags ExternalSemaphoreFeatureFlags
alias PhysicalDeviceVariablePointersFeatures PhysicalDeviceVariablePointerFeatures
alias PhysicalDeviceShaderDrawParametersFeatures PhysicalDeviceShaderDrawParameterFeatures
alias () PFNEnumerateInstanceVersion
alias () PFNBindBufferMemory2
alias () PFNBindImageMemory2
alias () PFNGetDeviceGroupPeerMemoryFeatures
alias () PFNCmdSetDeviceMask
alias () PFNCmdDispatchBase
alias () PFNEnumeratePhysicalDeviceGroups
alias () PFNGetImageMemoryRequirements2
alias () PFNGetBufferMemoryRequirements2
alias () PFNGetImageSparseMemoryRequirements2
alias () PFNGetPhysicalDeviceFeatures2
alias () PFNGetPhysicalDeviceProperties2
alias () PFNGetPhysicalDeviceFormatProperties2
alias () PFNGetPhysicalDeviceImageFormatProperties2
alias () PFNGetPhysicalDeviceQueueFamilyProperties2
alias () PFNGetPhysicalDeviceMemoryProperties2
alias () PFNGetPhysicalDeviceSparseImageFormatProperties2
alias () PFNTrimCommandPool
alias () PFNGetDeviceQueue2
alias () PFNCreateSamplerYcbcrConversion
alias () PFNDestroySamplerYcbcrConversion
alias () PFNCreateDescriptorUpdateTemplate
alias () PFNDestroyDescriptorUpdateTemplate
alias () PFNUpdateDescriptorSetWithTemplate
alias () PFNGetPhysicalDeviceExternalBufferProperties
alias () PFNGetPhysicalDeviceExternalFenceProperties
alias () PFNGetPhysicalDeviceExternalSemaphoreProperties
alias () PFNGetDescriptorSetLayoutSupport
enum DriverId {}
enum ShaderFloatControlsIndependence {}
enum SamplerReductionMode {}
enum SemaphoreType {}
enum ResolveModeFlagBits {}
alias Flags ResolveModeFlags
enum DescriptorBindingFlagBits {}
alias Flags DescriptorBindingFlags
enum SemaphoreWaitFlagBits {}
alias Flags SemaphoreWaitFlags
alias () PFNCmdDrawIndirectCount
alias () PFNCmdDrawIndexedIndirectCount
alias () PFNCreateRenderPass2
alias () PFNCmdBeginRenderPass2
alias () PFNCmdNextSubpass2
alias () PFNCmdEndRenderPass2
alias () PFNResetQueryPool
alias () PFNGetSemaphoreCounterValue
alias () PFNWaitSemaphores
alias () PFNSignalSemaphore
alias () PFNGetBufferDeviceAddress
alias () PFNGetBufferOpaqueCaptureAddress
alias () PFNGetDeviceMemoryOpaqueCaptureAddress
alias long SurfaceKHR
enum PresentModeKHR {}
enum ColorSpaceKHR {}
enum SurfaceTransformFlagBitsKHR {}
enum CompositeAlphaFlagBitsKHR {}
alias Flags CompositeAlphaFlagsKHR
alias Flags SurfaceTransformFlagsKHR
alias () PFNDestroySurfaceKHR
alias () PFNGetPhysicalDeviceSurfaceSupportKHR
alias () PFNGetPhysicalDeviceSurfaceCapabilitiesKHR
alias () PFNGetPhysicalDeviceSurfaceFormatsKHR
alias () PFNGetPhysicalDeviceSurfacePresentModesKHR
alias long SwapchainKHR
enum SwapchainCreateFlagBitsKHR {}
alias Flags SwapchainCreateFlagsKHR
enum DeviceGroupPresentModeFlagBitsKHR {}
alias Flags DeviceGroupPresentModeFlagsKHR
alias () PFNCreateSwapchainKHR
alias () PFNDestroySwapchainKHR
alias () PFNGetSwapchainImagesKHR
alias () PFNAcquireNextImageKHR
alias () PFNQueuePresentKHR
alias () PFNGetDeviceGroupPresentCapabilitiesKHR
alias () PFNGetDeviceGroupSurfacePresentModesKHR
alias () PFNGetPhysicalDevicePresentRectanglesKHR
alias () PFNAcquireNextImage2KHR
alias long DisplayKHR
alias long DisplayModeKHR
alias Flags DisplayModeCreateFlagsKHR
enum DisplayPlaneAlphaFlagBitsKHR {}
alias Flags DisplayPlaneAlphaFlagsKHR
alias Flags DisplaySurfaceCreateFlagsKHR
alias () PFNGetPhysicalDeviceDisplayPropertiesKHR
alias () PFNGetPhysicalDeviceDisplayPlanePropertiesKHR
alias () PFNGetDisplayPlaneSupportedDisplaysKHR
alias () PFNGetDisplayModePropertiesKHR
alias () PFNCreateDisplayModeKHR
alias () PFNGetDisplayPlaneCapabilitiesKHR
alias () PFNCreateDisplayPlaneSurfaceKHR
alias () PFNCreateSharedSwapchainsKHR
alias RenderPassMultiviewCreateInfo RenderPassMultiviewCreateInfoKHR
alias PhysicalDeviceMultiviewFeatures PhysicalDeviceMultiviewFeaturesKHR
alias PhysicalDeviceMultiviewProperties PhysicalDeviceMultiviewPropertiesKHR
alias PhysicalDeviceFeatures2 PhysicalDeviceFeatures2KHR
alias PhysicalDeviceProperties2 PhysicalDeviceProperties2KHR
alias FormatProperties2 FormatProperties2KHR
alias ImageFormatProperties2 ImageFormatProperties2KHR
alias PhysicalDeviceImageFormatInfo2 PhysicalDeviceImageFormatInfo2KHR
alias QueueFamilyProperties2 QueueFamilyProperties2KHR
alias PhysicalDeviceMemoryProperties2 PhysicalDeviceMemoryProperties2KHR
alias SparseImageFormatProperties2 SparseImageFormatProperties2KHR
alias PhysicalDeviceSparseImageFormatInfo2 PhysicalDeviceSparseImageFormatInfo2KHR
alias () PFNGetPhysicalDeviceFeatures2KHR
alias () PFNGetPhysicalDeviceProperties2KHR
alias () PFNGetPhysicalDeviceFormatProperties2KHR
alias () PFNGetPhysicalDeviceImageFormatProperties2KHR
alias () PFNGetPhysicalDeviceQueueFamilyProperties2KHR
alias () PFNGetPhysicalDeviceMemoryProperties2KHR
alias () PFNGetPhysicalDeviceSparseImageFormatProperties2KHR
alias PeerMemoryFeatureFlags PeerMemoryFeatureFlagsKHR
alias PeerMemoryFeatureFlagBits PeerMemoryFeatureFlagBitsKHR
alias MemoryAllocateFlags MemoryAllocateFlagsKHR
alias MemoryAllocateFlagBits MemoryAllocateFlagBitsKHR
alias MemoryAllocateFlagsInfo MemoryAllocateFlagsInfoKHR
alias DeviceGroupRenderPassBeginInfo DeviceGroupRenderPassBeginInfoKHR
alias DeviceGroupCommandBufferBeginInfo DeviceGroupCommandBufferBeginInfoKHR
alias DeviceGroupSubmitInfo DeviceGroupSubmitInfoKHR
alias DeviceGroupBindSparseInfo DeviceGroupBindSparseInfoKHR
alias BindBufferMemoryDeviceGroupInfo BindBufferMemoryDeviceGroupInfoKHR
alias BindImageMemoryDeviceGroupInfo BindImageMemoryDeviceGroupInfoKHR
alias () PFNGetDeviceGroupPeerMemoryFeaturesKHR
alias () PFNCmdSetDeviceMaskKHR
alias () PFNCmdDispatchBaseKHR
alias CommandPoolTrimFlags CommandPoolTrimFlagsKHR
alias () PFNTrimCommandPoolKHR
alias PhysicalDeviceGroupProperties PhysicalDeviceGroupPropertiesKHR
alias DeviceGroupDeviceCreateInfo DeviceGroupDeviceCreateInfoKHR
alias () PFNEnumeratePhysicalDeviceGroupsKHR
alias ExternalMemoryHandleTypeFlags ExternalMemoryHandleTypeFlagsKHR
alias ExternalMemoryHandleTypeFlagBits ExternalMemoryHandleTypeFlagBitsKHR
alias ExternalMemoryFeatureFlags ExternalMemoryFeatureFlagsKHR
alias ExternalMemoryFeatureFlagBits ExternalMemoryFeatureFlagBitsKHR
alias ExternalMemoryProperties ExternalMemoryPropertiesKHR
alias PhysicalDeviceExternalImageFormatInfo PhysicalDeviceExternalImageFormatInfoKHR
alias ExternalImageFormatProperties ExternalImageFormatPropertiesKHR
alias PhysicalDeviceExternalBufferInfo PhysicalDeviceExternalBufferInfoKHR
alias ExternalBufferProperties ExternalBufferPropertiesKHR
alias PhysicalDeviceIDProperties PhysicalDeviceIDPropertiesKHR
alias () PFNGetPhysicalDeviceExternalBufferPropertiesKHR
alias ExternalMemoryImageCreateInfo ExternalMemoryImageCreateInfoKHR
alias ExternalMemoryBufferCreateInfo ExternalMemoryBufferCreateInfoKHR
alias ExportMemoryAllocateInfo ExportMemoryAllocateInfoKHR
alias () PFNGetMemoryFdKHR
alias () PFNGetMemoryFdPropertiesKHR
alias ExternalSemaphoreHandleTypeFlags ExternalSemaphoreHandleTypeFlagsKHR
alias ExternalSemaphoreHandleTypeFlagBits ExternalSemaphoreHandleTypeFlagBitsKHR
alias ExternalSemaphoreFeatureFlags ExternalSemaphoreFeatureFlagsKHR
alias ExternalSemaphoreFeatureFlagBits ExternalSemaphoreFeatureFlagBitsKHR
alias PhysicalDeviceExternalSemaphoreInfo PhysicalDeviceExternalSemaphoreInfoKHR
alias ExternalSemaphoreProperties ExternalSemaphorePropertiesKHR
alias () PFNGetPhysicalDeviceExternalSemaphorePropertiesKHR
alias SemaphoreImportFlags SemaphoreImportFlagsKHR
alias SemaphoreImportFlagBits SemaphoreImportFlagBitsKHR
alias ExportSemaphoreCreateInfo ExportSemaphoreCreateInfoKHR
alias () PFNImportSemaphoreFdKHR
alias () PFNGetSemaphoreFdKHR
alias () PFNCmdPushDescriptorSetKHR
alias () PFNCmdPushDescriptorSetWithTemplateKHR
alias PhysicalDeviceShaderFloat16Int8Features PhysicalDeviceShaderFloat16Int8FeaturesKHR
alias PhysicalDeviceShaderFloat16Int8Features PhysicalDeviceFloat16Int8FeaturesKHR
alias PhysicalDevice16BitStorageFeatures PhysicalDevice16BitStorageFeaturesKHR
alias DescriptorUpdateTemplate DescriptorUpdateTemplateKHR
alias DescriptorUpdateTemplateType DescriptorUpdateTemplateTypeKHR
alias DescriptorUpdateTemplateCreateFlags DescriptorUpdateTemplateCreateFlagsKHR
alias DescriptorUpdateTemplateEntry DescriptorUpdateTemplateEntryKHR
alias DescriptorUpdateTemplateCreateInfo DescriptorUpdateTemplateCreateInfoKHR
alias () PFNCreateDescriptorUpdateTemplateKHR
alias () PFNDestroyDescriptorUpdateTemplateKHR
alias () PFNUpdateDescriptorSetWithTemplateKHR
alias PhysicalDeviceImagelessFramebufferFeatures PhysicalDeviceImagelessFramebufferFeaturesKHR
alias FramebufferAttachmentsCreateInfo FramebufferAttachmentsCreateInfoKHR
alias FramebufferAttachmentImageInfo FramebufferAttachmentImageInfoKHR
alias RenderPassAttachmentBeginInfo RenderPassAttachmentBeginInfoKHR
alias RenderPassCreateInfo2 RenderPassCreateInfo2KHR
alias AttachmentDescription2 AttachmentDescription2KHR
alias AttachmentReference2 AttachmentReference2KHR
alias SubpassDescription2 SubpassDescription2KHR
alias SubpassDependency2 SubpassDependency2KHR
alias SubpassBeginInfo SubpassBeginInfoKHR
alias SubpassEndInfo SubpassEndInfoKHR
alias () PFNCreateRenderPass2KHR
alias () PFNCmdBeginRenderPass2KHR
alias () PFNCmdNextSubpass2KHR
alias () PFNCmdEndRenderPass2KHR
alias () PFNGetSwapchainStatusKHR
alias ExternalFenceHandleTypeFlags ExternalFenceHandleTypeFlagsKHR
alias ExternalFenceHandleTypeFlagBits ExternalFenceHandleTypeFlagBitsKHR
alias ExternalFenceFeatureFlags ExternalFenceFeatureFlagsKHR
alias ExternalFenceFeatureFlagBits ExternalFenceFeatureFlagBitsKHR
alias PhysicalDeviceExternalFenceInfo PhysicalDeviceExternalFenceInfoKHR
alias ExternalFenceProperties ExternalFencePropertiesKHR
alias () PFNGetPhysicalDeviceExternalFencePropertiesKHR
alias FenceImportFlags FenceImportFlagsKHR
alias FenceImportFlagBits FenceImportFlagBitsKHR
alias ExportFenceCreateInfo ExportFenceCreateInfoKHR
alias () PFNImportFenceFdKHR
alias () PFNGetFenceFdKHR
enum PerformanceCounterUnitKHR {}
enum PerformanceCounterScopeKHR {}
enum PerformanceCounterStorageKHR {}
enum PerformanceCounterDescriptionFlagBitsKHR {}
alias Flags PerformanceCounterDescriptionFlagsKHR
enum AcquireProfilingLockFlagBitsKHR {}
alias Flags AcquireProfilingLockFlagsKHR
alias () PFNEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR
alias () PFNGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR
alias () PFNAcquireProfilingLockKHR
alias () PFNReleaseProfilingLockKHR
alias PointClippingBehavior PointClippingBehaviorKHR
alias TessellationDomainOrigin TessellationDomainOriginKHR
alias PhysicalDevicePointClippingProperties PhysicalDevicePointClippingPropertiesKHR
alias RenderPassInputAttachmentAspectCreateInfo RenderPassInputAttachmentAspectCreateInfoKHR
alias InputAttachmentAspectReference InputAttachmentAspectReferenceKHR
alias ImageViewUsageCreateInfo ImageViewUsageCreateInfoKHR
alias PipelineTessellationDomainOriginStateCreateInfo PipelineTessellationDomainOriginStateCreateInfoKHR
alias () PFNGetPhysicalDeviceSurfaceCapabilities2KHR
alias () PFNGetPhysicalDeviceSurfaceFormats2KHR
alias PhysicalDeviceVariablePointersFeatures PhysicalDeviceVariablePointerFeaturesKHR
alias PhysicalDeviceVariablePointersFeatures PhysicalDeviceVariablePointersFeaturesKHR
alias () PFNGetPhysicalDeviceDisplayProperties2KHR
alias () PFNGetPhysicalDeviceDisplayPlaneProperties2KHR
alias () PFNGetDisplayModeProperties2KHR
alias () PFNGetDisplayPlaneCapabilities2KHR
alias MemoryDedicatedRequirements MemoryDedicatedRequirementsKHR
alias MemoryDedicatedAllocateInfo MemoryDedicatedAllocateInfoKHR
alias BufferMemoryRequirementsInfo2 BufferMemoryRequirementsInfo2KHR
alias ImageMemoryRequirementsInfo2 ImageMemoryRequirementsInfo2KHR
alias ImageSparseMemoryRequirementsInfo2 ImageSparseMemoryRequirementsInfo2KHR
alias MemoryRequirements2 MemoryRequirements2KHR
alias SparseImageMemoryRequirements2 SparseImageMemoryRequirements2KHR
alias () PFNGetImageMemoryRequirements2KHR
alias () PFNGetBufferMemoryRequirements2KHR
alias () PFNGetImageSparseMemoryRequirements2KHR
alias ImageFormatListCreateInfo ImageFormatListCreateInfoKHR
alias SamplerYcbcrConversion SamplerYcbcrConversionKHR
alias SamplerYcbcrModelConversion SamplerYcbcrModelConversionKHR
alias SamplerYcbcrRange SamplerYcbcrRangeKHR
alias ChromaLocation ChromaLocationKHR
alias SamplerYcbcrConversionCreateInfo SamplerYcbcrConversionCreateInfoKHR
alias SamplerYcbcrConversionInfo SamplerYcbcrConversionInfoKHR
alias BindImagePlaneMemoryInfo BindImagePlaneMemoryInfoKHR
alias ImagePlaneMemoryRequirementsInfo ImagePlaneMemoryRequirementsInfoKHR
alias PhysicalDeviceSamplerYcbcrConversionFeatures PhysicalDeviceSamplerYcbcrConversionFeaturesKHR
alias SamplerYcbcrConversionImageFormatProperties SamplerYcbcrConversionImageFormatPropertiesKHR
alias () PFNCreateSamplerYcbcrConversionKHR
alias () PFNDestroySamplerYcbcrConversionKHR
alias BindBufferMemoryInfo BindBufferMemoryInfoKHR
alias BindImageMemoryInfo BindImageMemoryInfoKHR
alias () PFNBindBufferMemory2KHR
alias () PFNBindImageMemory2KHR
alias PhysicalDeviceMaintenance3Properties PhysicalDeviceMaintenance3PropertiesKHR
alias DescriptorSetLayoutSupport DescriptorSetLayoutSupportKHR
alias () PFNGetDescriptorSetLayoutSupportKHR
alias () PFNCmdDrawIndirectCountKHR
alias () PFNCmdDrawIndexedIndirectCountKHR
alias PhysicalDeviceShaderSubgroupExtendedTypesFeatures PhysicalDeviceShaderSubgroupExtendedTypesFeaturesKHR
alias PhysicalDevice8BitStorageFeatures PhysicalDevice8BitStorageFeaturesKHR
alias PhysicalDeviceShaderAtomicInt64Features PhysicalDeviceShaderAtomicInt64FeaturesKHR
alias DriverId DriverIdKHR
alias ConformanceVersion ConformanceVersionKHR
alias PhysicalDeviceDriverProperties PhysicalDeviceDriverPropertiesKHR
alias ShaderFloatControlsIndependence ShaderFloatControlsIndependenceKHR
alias PhysicalDeviceFloatControlsProperties PhysicalDeviceFloatControlsPropertiesKHR
alias ResolveModeFlagBits ResolveModeFlagBitsKHR
alias ResolveModeFlags ResolveModeFlagsKHR
alias SubpassDescriptionDepthStencilResolve SubpassDescriptionDepthStencilResolveKHR
alias PhysicalDeviceDepthStencilResolveProperties PhysicalDeviceDepthStencilResolvePropertiesKHR
alias SemaphoreType SemaphoreTypeKHR
alias SemaphoreWaitFlagBits SemaphoreWaitFlagBitsKHR
alias SemaphoreWaitFlags SemaphoreWaitFlagsKHR
alias PhysicalDeviceTimelineSemaphoreFeatures PhysicalDeviceTimelineSemaphoreFeaturesKHR
alias PhysicalDeviceTimelineSemaphoreProperties PhysicalDeviceTimelineSemaphorePropertiesKHR
alias SemaphoreTypeCreateInfo SemaphoreTypeCreateInfoKHR
alias TimelineSemaphoreSubmitInfo TimelineSemaphoreSubmitInfoKHR
alias SemaphoreWaitInfo SemaphoreWaitInfoKHR
alias SemaphoreSignalInfo SemaphoreSignalInfoKHR
alias () PFNGetSemaphoreCounterValueKHR
alias () PFNWaitSemaphoresKHR
alias () PFNSignalSemaphoreKHR
alias PhysicalDeviceVulkanMemoryModelFeatures PhysicalDeviceVulkanMemoryModelFeaturesKHR
enum FragmentShadingRateCombinerOpKHR {}
alias () PFNGetPhysicalDeviceFragmentShadingRatesKHR
alias () PFNCmdSetFragmentShadingRateKHR
alias PhysicalDeviceSeparateDepthStencilLayoutsFeatures PhysicalDeviceSeparateDepthStencilLayoutsFeaturesKHR
alias AttachmentReferenceStencilLayout AttachmentReferenceStencilLayoutKHR
alias AttachmentDescriptionStencilLayout AttachmentDescriptionStencilLayoutKHR
alias PhysicalDeviceUniformBufferStandardLayoutFeatures PhysicalDeviceUniformBufferStandardLayoutFeaturesKHR
alias PhysicalDeviceBufferDeviceAddressFeatures PhysicalDeviceBufferDeviceAddressFeaturesKHR
alias BufferDeviceAddressInfo BufferDeviceAddressInfoKHR
alias BufferOpaqueCaptureAddressCreateInfo BufferOpaqueCaptureAddressCreateInfoKHR
alias MemoryOpaqueCaptureAddressAllocateInfo MemoryOpaqueCaptureAddressAllocateInfoKHR
alias DeviceMemoryOpaqueCaptureAddressInfo DeviceMemoryOpaqueCaptureAddressInfoKHR
alias () PFNGetBufferDeviceAddressKHR
alias () PFNGetBufferOpaqueCaptureAddressKHR
alias () PFNGetDeviceMemoryOpaqueCaptureAddressKHR
alias long DeferredOperationKHR
alias () PFNCreateDeferredOperationKHR
alias () PFNDestroyDeferredOperationKHR
alias () PFNGetDeferredOperationMaxConcurrencyKHR
alias () PFNGetDeferredOperationResultKHR
alias () PFNDeferredOperationJoinKHR
enum PipelineExecutableStatisticFormatKHR {}
alias () PFNGetPipelineExecutablePropertiesKHR
alias () PFNGetPipelineExecutableStatisticsKHR
alias () PFNGetPipelineExecutableInternalRepresentationsKHR
alias () PFNCmdCopyBuffer2KHR
alias () PFNCmdCopyImage2KHR
alias () PFNCmdCopyBufferToImage2KHR
alias () PFNCmdCopyImageToBuffer2KHR
alias () PFNCmdBlitImage2KHR
alias () PFNCmdResolveImage2KHR
alias long DebugReportCallbackEXT
enum DebugReportObjectTypeEXT {}
enum DebugReportFlagBitsEXT {}
alias Flags DebugReportFlagsEXT
alias () PFNDebugReportCallbackEXT
alias () PFNCreateDebugReportCallbackEXT
alias () PFNDestroyDebugReportCallbackEXT
alias () PFNDebugReportMessageEXT
enum RasterizationOrderAMD {}
alias () PFNDebugMarkerSetObjectTagEXT
alias () PFNDebugMarkerSetObjectNameEXT
alias () PFNCmdDebugMarkerBeginEXT
alias () PFNCmdDebugMarkerEndEXT
alias () PFNCmdDebugMarkerInsertEXT
alias Flags PipelineRasterizationStateStreamCreateFlagsEXT
alias () PFNCmdBindTransformFeedbackBuffersEXT
alias () PFNCmdBeginTransformFeedbackEXT
alias () PFNCmdEndTransformFeedbackEXT
alias () PFNCmdBeginQueryIndexedEXT
alias () PFNCmdEndQueryIndexedEXT
alias () PFNCmdDrawIndirectByteCountEXT
alias () PFNGetImageViewHandleNVX
alias () PFNGetImageViewAddressNVX
alias () PFNCmdDrawIndirectCountAMD
alias () PFNCmdDrawIndexedIndirectCountAMD
enum ShaderInfoTypeAMD {}
alias () PFNGetShaderInfoAMD
enum ExternalMemoryHandleTypeFlagBitsNV {}
alias Flags ExternalMemoryHandleTypeFlagsNV
enum ExternalMemoryFeatureFlagBitsNV {}
alias Flags ExternalMemoryFeatureFlagsNV
alias () PFNGetPhysicalDeviceExternalImageFormatPropertiesNV
enum ValidationCheckEXT {}
enum ConditionalRenderingFlagBitsEXT {}
alias Flags ConditionalRenderingFlagsEXT
alias () PFNCmdBeginConditionalRenderingEXT
alias () PFNCmdEndConditionalRenderingEXT
alias () PFNCmdSetViewportWScalingNV
alias () PFNReleaseDisplayEXT
enum SurfaceCounterFlagBitsEXT {}
alias Flags SurfaceCounterFlagsEXT
alias () PFNGetPhysicalDeviceSurfaceCapabilities2EXT
enum DisplayPowerStateEXT {}
enum DeviceEventTypeEXT {}
enum DisplayEventTypeEXT {}
alias () PFNDisplayPowerControlEXT
alias () PFNRegisterDeviceEventEXT
alias () PFNRegisterDisplayEventEXT
alias () PFNGetSwapchainCounterEXT
alias () PFNGetRefreshCycleDurationGOOGLE
alias () PFNGetPastPresentationTimingGOOGLE
enum ViewportCoordinateSwizzleNV {}
alias Flags PipelineViewportSwizzleStateCreateFlagsNV
enum DiscardRectangleModeEXT {}
alias Flags PipelineDiscardRectangleStateCreateFlagsEXT
alias () PFNCmdSetDiscardRectangleEXT
enum ConservativeRasterizationModeEXT {}
alias Flags PipelineRasterizationConservativeStateCreateFlagsEXT
alias Flags PipelineRasterizationDepthClipStateCreateFlagsEXT
alias () PFNSetHdrMetadataEXT
alias long DebugUtilsMessengerEXT
alias Flags DebugUtilsMessengerCallbackDataFlagsEXT
enum DebugUtilsMessageSeverityFlagBitsEXT {}
enum DebugUtilsMessageTypeFlagBitsEXT {}
alias Flags DebugUtilsMessageTypeFlagsEXT
alias Flags DebugUtilsMessageSeverityFlagsEXT
alias Flags DebugUtilsMessengerCreateFlagsEXT
alias () PFNDebugUtilsMessengerCallbackEXT
alias () PFNSetDebugUtilsObjectNameEXT
alias () PFNSetDebugUtilsObjectTagEXT
alias () PFNQueueBeginDebugUtilsLabelEXT
alias () PFNQueueEndDebugUtilsLabelEXT
alias () PFNQueueInsertDebugUtilsLabelEXT
alias () PFNCmdBeginDebugUtilsLabelEXT
alias () PFNCmdEndDebugUtilsLabelEXT
alias () PFNCmdInsertDebugUtilsLabelEXT
alias () PFNCreateDebugUtilsMessengerEXT
alias () PFNDestroyDebugUtilsMessengerEXT
alias () PFNSubmitDebugUtilsMessageEXT
alias SamplerReductionMode SamplerReductionModeEXT
alias SamplerReductionModeCreateInfo SamplerReductionModeCreateInfoEXT
alias PhysicalDeviceSamplerFilterMinmaxProperties PhysicalDeviceSamplerFilterMinmaxPropertiesEXT
alias () PFNCmdSetSampleLocationsEXT
alias () PFNGetPhysicalDeviceMultisamplePropertiesEXT
enum BlendOverlapEXT {}
alias Flags PipelineCoverageToColorStateCreateFlagsNV
enum CoverageModulationModeNV {}
alias Flags PipelineCoverageModulationStateCreateFlagsNV
alias () PFNGetImageDrmFormatModifierPropertiesEXT
alias long ValidationCacheEXT
enum ValidationCacheHeaderVersionEXT {}
alias Flags ValidationCacheCreateFlagsEXT
alias () PFNCreateValidationCacheEXT
alias () PFNDestroyValidationCacheEXT
alias () PFNMergeValidationCachesEXT
alias () PFNGetValidationCacheDataEXT
alias DescriptorBindingFlagBits DescriptorBindingFlagBitsEXT
alias DescriptorBindingFlags DescriptorBindingFlagsEXT
alias DescriptorSetLayoutBindingFlagsCreateInfo DescriptorSetLayoutBindingFlagsCreateInfoEXT
alias PhysicalDeviceDescriptorIndexingFeatures PhysicalDeviceDescriptorIndexingFeaturesEXT
alias PhysicalDeviceDescriptorIndexingProperties PhysicalDeviceDescriptorIndexingPropertiesEXT
alias DescriptorSetVariableDescriptorCountAllocateInfo DescriptorSetVariableDescriptorCountAllocateInfoEXT
alias DescriptorSetVariableDescriptorCountLayoutSupport DescriptorSetVariableDescriptorCountLayoutSupportEXT
enum ShadingRatePaletteEntryNV {}
enum CoarseSampleOrderTypeNV {}
alias () PFNCmdBindShadingRateImageNV
alias () PFNCmdSetViewportShadingRatePaletteNV
alias () PFNCmdSetCoarseSampleOrderNV
alias long AccelerationStructureNV
enum RayTracingShaderGroupTypeKHR {}
alias RayTracingShaderGroupTypeKHR RayTracingShaderGroupTypeNV
enum GeometryTypeKHR {}
alias GeometryTypeKHR GeometryTypeNV
enum AccelerationStructureTypeKHR {}
alias AccelerationStructureTypeKHR AccelerationStructureTypeNV
enum CopyAccelerationStructureModeKHR {}
alias CopyAccelerationStructureModeKHR CopyAccelerationStructureModeNV
enum AccelerationStructureMemoryRequirementsTypeNV {}
enum GeometryFlagBitsKHR {}
alias Flags GeometryFlagsKHR
alias GeometryFlagsKHR GeometryFlagsNV
alias GeometryFlagBitsKHR GeometryFlagBitsNV
enum GeometryInstanceFlagBitsKHR {}
alias Flags GeometryInstanceFlagsKHR
alias GeometryInstanceFlagsKHR GeometryInstanceFlagsNV
alias GeometryInstanceFlagBitsKHR GeometryInstanceFlagBitsNV
enum BuildAccelerationStructureFlagBitsKHR {}
alias Flags BuildAccelerationStructureFlagsKHR
alias BuildAccelerationStructureFlagsKHR BuildAccelerationStructureFlagsNV
alias BuildAccelerationStructureFlagBitsKHR BuildAccelerationStructureFlagBitsNV
alias TransformMatrixKHR TransformMatrixNV
alias AabbPositionsKHR AabbPositionsNV
alias AccelerationStructureInstanceKHR AccelerationStructureInstanceNV
alias () PFNCreateAccelerationStructureNV
alias () PFNDestroyAccelerationStructureNV
alias () PFNGetAccelerationStructureMemoryRequirementsNV
alias () PFNBindAccelerationStructureMemoryNV
alias () PFNCmdBuildAccelerationStructureNV
alias () PFNCmdCopyAccelerationStructureNV
alias () PFNCmdTraceRaysNV
alias () PFNCreateRayTracingPipelinesNV
alias () PFNGetRayTracingShaderGroupHandlesKHR
alias () PFNGetRayTracingShaderGroupHandlesNV
alias () PFNGetAccelerationStructureHandleNV
alias () PFNCmdWriteAccelerationStructuresPropertiesNV
alias () PFNCompileDeferredNV
enum QueueGlobalPriorityEXT {}
alias () PFNGetMemoryHostPointerPropertiesEXT
alias () PFNCmdWriteBufferMarkerAMD
enum PipelineCompilerControlFlagBitsAMD {}
alias Flags PipelineCompilerControlFlagsAMD
enum TimeDomainEXT {}
alias () PFNGetPhysicalDeviceCalibrateableTimeDomainsEXT
alias () PFNGetCalibratedTimestampsEXT
enum MemoryOverallocationBehaviorAMD {}
enum PipelineCreationFeedbackFlagBitsEXT {}
alias Flags PipelineCreationFeedbackFlagsEXT
alias () PFNCmdDrawMeshTasksNV
alias () PFNCmdDrawMeshTasksIndirectNV
alias () PFNCmdDrawMeshTasksIndirectCountNV
alias () PFNCmdSetExclusiveScissorNV
alias () PFNCmdSetCheckpointNV
alias () PFNGetQueueCheckpointDataNV
alias long PerformanceConfigurationINTEL
enum PerformanceConfigurationTypeINTEL {}
enum QueryPoolSamplingModeINTEL {}
enum PerformanceOverrideTypeINTEL {}
enum PerformanceParameterTypeINTEL {}
enum PerformanceValueTypeINTEL {}
alias QueryPoolPerformanceQueryCreateInfoINTEL QueryPoolCreateInfoINTEL
alias () PFNInitializePerformanceApiINTEL
alias () PFNUninitializePerformanceApiINTEL
alias () PFNCmdSetPerformanceMarkerINTEL
alias () PFNCmdSetPerformanceStreamMarkerINTEL
alias () PFNCmdSetPerformanceOverrideINTEL
alias () PFNAcquirePerformanceConfigurationINTEL
alias () PFNReleasePerformanceConfigurationINTEL
alias () PFNQueueSetPerformanceConfigurationINTEL
alias () PFNGetPerformanceParameterINTEL
alias () PFNSetLocalDimmingAMD
alias PhysicalDeviceScalarBlockLayoutFeatures PhysicalDeviceScalarBlockLayoutFeaturesEXT
enum ShaderCorePropertiesFlagBitsAMD {}
alias Flags ShaderCorePropertiesFlagsAMD
alias PhysicalDeviceBufferDeviceAddressFeaturesEXT PhysicalDeviceBufferAddressFeaturesEXT
alias BufferDeviceAddressInfo BufferDeviceAddressInfoEXT
alias () PFNGetBufferDeviceAddressEXT
enum ToolPurposeFlagBitsEXT {}
alias Flags ToolPurposeFlagsEXT
alias () PFNGetPhysicalDeviceToolPropertiesEXT
alias ImageStencilUsageCreateInfo ImageStencilUsageCreateInfoEXT
enum ValidationFeatureEnableEXT {}
enum ValidationFeatureDisableEXT {}
enum ComponentTypeNV {}
enum ScopeNV {}
alias () PFNGetPhysicalDeviceCooperativeMatrixPropertiesNV
enum CoverageReductionModeNV {}
alias Flags PipelineCoverageReductionStateCreateFlagsNV
alias () PFNGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV
alias Flags HeadlessSurfaceCreateFlagsEXT
alias () PFNCreateHeadlessSurfaceEXT
enum LineRasterizationModeEXT {}
alias () PFNCmdSetLineStippleEXT
alias PhysicalDeviceHostQueryResetFeatures PhysicalDeviceHostQueryResetFeaturesEXT
alias () PFNResetQueryPoolEXT
alias () PFNCmdSetCullModeEXT
alias () PFNCmdSetFrontFaceEXT
alias () PFNCmdSetPrimitiveTopologyEXT
alias () PFNCmdSetViewportWithCountEXT
alias () PFNCmdSetScissorWithCountEXT
alias () PFNCmdBindVertexBuffers2EXT
alias () PFNCmdSetDepthTestEnableEXT
alias () PFNCmdSetDepthWriteEnableEXT
alias () PFNCmdSetDepthCompareOpEXT
alias () PFNCmdSetDepthBoundsTestEnableEXT
alias () PFNCmdSetStencilTestEnableEXT
alias () PFNCmdSetStencilOpEXT
alias long IndirectCommandsLayoutNV
enum IndirectCommandsTokenTypeNV {}
enum IndirectStateFlagBitsNV {}
alias Flags IndirectStateFlagsNV
enum IndirectCommandsLayoutUsageFlagBitsNV {}
alias Flags IndirectCommandsLayoutUsageFlagsNV
alias () PFNGetGeneratedCommandsMemoryRequirementsNV
alias () PFNCmdPreprocessGeneratedCommandsNV
alias () PFNCmdExecuteGeneratedCommandsNV
alias () PFNCmdBindPipelineShaderGroupNV
alias () PFNCreateIndirectCommandsLayoutNV
alias () PFNDestroyIndirectCommandsLayoutNV
enum DeviceMemoryReportEventTypeEXT {}
alias Flags DeviceMemoryReportFlagsEXT
alias () PFNDeviceMemoryReportCallbackEXT
alias long PrivateDataSlotEXT
enum PrivateDataSlotCreateFlagBitsEXT {}
alias Flags PrivateDataSlotCreateFlagsEXT
alias () PFNCreatePrivateDataSlotEXT
alias () PFNDestroyPrivateDataSlotEXT
alias () PFNSetPrivateDataEXT
alias () PFNGetPrivateDataEXT
enum DeviceDiagnosticsConfigFlagBitsNV {}
alias Flags DeviceDiagnosticsConfigFlagsNV
enum FragmentShadingRateTypeNV {}
enum FragmentShadingRateNV {}
alias () PFNCmdSetFragmentShadingRateEnumNV
alias long AccelerationStructureKHR
enum BuildAccelerationStructureModeKHR {}
enum AccelerationStructureBuildTypeKHR {}
enum AccelerationStructureCompatibilityKHR {}
enum AccelerationStructureCreateFlagBitsKHR {}
alias Flags AccelerationStructureCreateFlagsKHR
alias () PFNCreateAccelerationStructureKHR
alias () PFNDestroyAccelerationStructureKHR
alias () PFNCmdBuildAccelerationStructuresKHR
alias () PFNCmdBuildAccelerationStructuresIndirectKHR
alias () PFNBuildAccelerationStructuresKHR
alias () PFNCopyAccelerationStructureKHR
alias () PFNCopyAccelerationStructureToMemoryKHR
alias () PFNCopyMemoryToAccelerationStructureKHR
alias () PFNWriteAccelerationStructuresPropertiesKHR
alias () PFNCmdCopyAccelerationStructureKHR
alias () PFNCmdCopyAccelerationStructureToMemoryKHR
alias () PFNCmdCopyMemoryToAccelerationStructureKHR
alias () PFNGetAccelerationStructureDeviceAddressKHR
alias () PFNCmdWriteAccelerationStructuresPropertiesKHR
alias () PFNGetDeviceAccelerationStructureCompatibilityKHR
alias () PFNGetAccelerationStructureBuildSizesKHR
enum ShaderGroupShaderKHR {}
alias () PFNCmdTraceRaysKHR
alias () PFNCreateRayTracingPipelinesKHR
alias () PFNGetRayTracingCaptureReplayShaderGroupHandlesKHR
alias () PFNCmdTraceRaysIndirectKHR
alias () PFNGetRayTracingShaderGroupStackSizeKHR
alias () PFNCmdSetRayTracingPipelineStackSizeKHR
type Extent2D {
	width uint
	height uint
	height uint
}

type Extent3D {
	width uint
	height uint
	depth uint
	depth uint
}

type Offset2D {
	x int
	y int
	y int
}

type Offset3D {
	x int
	y int
	z int
	z int
}

type Rect2D {
	offset Offset2D
	extent Extent2D
	extent Extent2D
}

type BaseInStructure {
	sType StructureType
	pNext *BaseInStructure
	pNext *BaseInStructure
}

type BaseOutStructure {
	sType StructureType
	pNext *BaseOutStructure
	pNext *BaseOutStructure
}

type BufferMemoryBarrier {
	sType StructureType
	pNext *[]
	srcAccessMask AccessFlags
	dstAccessMask AccessFlags
	srcQueueFamilyIndex uint
	dstQueueFamilyIndex uint
	buffer Buffer
	offset DeviceSize
	size DeviceSize
	size DeviceSize
}

type DispatchIndirectCommand {
	x uint
	y uint
	z uint
	z uint
}

type DrawIndexedIndirectCommand {
	indexCount uint
	instanceCount uint
	firstIndex uint
	vertexOffset int
	firstInstance uint
	firstInstance uint
}

type DrawIndirectCommand {
	vertexCount uint
	instanceCount uint
	firstVertex uint
	firstInstance uint
	firstInstance uint
}

type ImageSubresourceRange {
	aspectMask ImageAspectFlags
	baseMipLevel uint
	levelCount uint
	baseArrayLayer uint
	layerCount uint
	layerCount uint
}

type ImageMemoryBarrier {
	sType StructureType
	pNext *[]
	srcAccessMask AccessFlags
	dstAccessMask AccessFlags
	oldLayout ImageLayout
	newLayout ImageLayout
	srcQueueFamilyIndex uint
	dstQueueFamilyIndex uint
	image Image
	subresourceRange ImageSubresourceRange
	subresourceRange ImageSubresourceRange
}

type MemoryBarrier {
	sType StructureType
	pNext *[]
	srcAccessMask AccessFlags
	dstAccessMask AccessFlags
	dstAccessMask AccessFlags
}

type AllocationCallbacks {
	pUserData *[]
	pfnAllocation PFNAllocationFunction
	pfnReallocation PFNReallocationFunction
	pfnFree PFNFreeFunction
	pfnInternalAllocation PFNInternalAllocationNotification
	pfnInternalFree PFNInternalFreeNotification
	pfnInternalFree PFNInternalFreeNotification
}

type ApplicationInfo {
	sType StructureType
	pNext *[]
	pApplicationName *byte
	applicationVersion uint
	pEngineName *byte
	engineVersion uint
	apiVersion uint
	apiVersion uint
}

type FormatProperties {
	linearTilingFeatures FormatFeatureFlags
	optimalTilingFeatures FormatFeatureFlags
	bufferFeatures FormatFeatureFlags
	bufferFeatures FormatFeatureFlags
}

type ImageFormatProperties {
	maxExtent Extent3D
	maxMipLevels uint
	maxArrayLayers uint
	sampleCounts SampleCountFlags
	maxResourceSize DeviceSize
	maxResourceSize DeviceSize
}

type InstanceCreateInfo {
	sType StructureType
	pNext *[]
	flags InstanceCreateFlags
	pApplicationInfo *ApplicationInfo
	enabledLayerCount uint
	ppEnabledLayerNames **byte
	enabledExtensionCount uint
	ppEnabledExtensionNames **byte
	ppEnabledExtensionNames **byte
}

type MemoryHeap {
	size DeviceSize
	flags MemoryHeapFlags
	flags MemoryHeapFlags
}

type MemoryType {
	propertyFlags MemoryPropertyFlags
	heapIndex uint
	heapIndex uint
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

type PhysicalDeviceLimits {
	maxImageDimension1D uint
	maxImageDimension2D uint
	maxImageDimension3D uint
	maxImageDimensionCube uint
	maxImageArrayLayers uint
	maxTexelBufferElements uint
	maxUniformBufferRange uint
	maxStorageBufferRange uint
	maxPushConstantsSize uint
	maxMemoryAllocationCount uint
	maxSamplerAllocationCount uint
	bufferImageGranularity DeviceSize
	sparseAddressSpaceSize DeviceSize
	maxBoundDescriptorSets uint
	maxPerStageDescriptorSamplers uint
	maxPerStageDescriptorUniformBuffers uint
	maxPerStageDescriptorStorageBuffers uint
	maxPerStageDescriptorSampledImages uint
	maxPerStageDescriptorStorageImages uint
	maxPerStageDescriptorInputAttachments uint
	maxPerStageResources uint
	maxDescriptorSetSamplers uint
	maxDescriptorSetUniformBuffers uint
	maxDescriptorSetUniformBuffersDynamic uint
	maxDescriptorSetStorageBuffers uint
	maxDescriptorSetStorageBuffersDynamic uint
	maxDescriptorSetSampledImages uint
	maxDescriptorSetStorageImages uint
	maxDescriptorSetInputAttachments uint
	maxVertexInputAttributes uint
	maxVertexInputBindings uint
	maxVertexInputAttributeOffset uint
	maxVertexInputBindingStride uint
	maxVertexOutputComponents uint
	maxTessellationGenerationLevel uint
	maxTessellationPatchSize uint
	maxTessellationControlPerVertexInputComponents uint
	maxTessellationControlPerVertexOutputComponents uint
	maxTessellationControlPerPatchOutputComponents uint
	maxTessellationControlTotalOutputComponents uint
	maxTessellationEvaluationInputComponents uint
	maxTessellationEvaluationOutputComponents uint
	maxGeometryShaderInvocations uint
	maxGeometryInputComponents uint
	maxGeometryOutputComponents uint
	maxGeometryOutputVertices uint
	maxGeometryTotalOutputComponents uint
	maxFragmentInputComponents uint
	maxFragmentOutputAttachments uint
	maxFragmentDualSrcAttachments uint
	maxFragmentCombinedOutputResources uint
	maxComputeSharedMemorySize uint
	maxComputeWorkGroupCount uint
	maxComputeWorkGroupInvocations uint
	maxComputeWorkGroupSize uint
	subPixelPrecisionBits uint
	subTexelPrecisionBits uint
	mipmapPrecisionBits uint
	maxDrawIndexedIndexValue uint
	maxDrawIndirectCount uint
	maxSamplerLodBias real
	maxSamplerAnisotropy real
	maxViewports uint
	maxViewportDimensions uint
	viewportBoundsRange real
	viewportSubPixelBits uint
	minMemoryMapAlignment word
	minTexelBufferOffsetAlignment DeviceSize
	minUniformBufferOffsetAlignment DeviceSize
	minStorageBufferOffsetAlignment DeviceSize
	minTexelOffset int
	maxTexelOffset uint
	minTexelGatherOffset int
	maxTexelGatherOffset uint
	minInterpolationOffset real
	maxInterpolationOffset real
	subPixelInterpolationOffsetBits uint
	maxFramebufferWidth uint
	maxFramebufferHeight uint
	maxFramebufferLayers uint
	framebufferColorSampleCounts SampleCountFlags
	framebufferDepthSampleCounts SampleCountFlags
	framebufferStencilSampleCounts SampleCountFlags
	framebufferNoAttachmentsSampleCounts SampleCountFlags
	maxColorAttachments uint
	sampledImageColorSampleCounts SampleCountFlags
	sampledImageIntegerSampleCounts SampleCountFlags
	sampledImageDepthSampleCounts SampleCountFlags
	sampledImageStencilSampleCounts SampleCountFlags
	storageImageSampleCounts SampleCountFlags
	maxSampleMaskWords uint
	timestampComputeAndGraphics Bool32
	timestampPeriod real
	maxClipDistances uint
	maxCullDistances uint
	maxCombinedClipAndCullDistances uint
	discreteQueuePriorities uint
	pointSizeRange real
	lineWidthRange real
	pointSizeGranularity real
	lineWidthGranularity real
	strictLines Bool32
	standardSampleLocations Bool32
	optimalBufferCopyOffsetAlignment DeviceSize
	optimalBufferCopyRowPitchAlignment DeviceSize
	nonCoherentAtomSize DeviceSize
	nonCoherentAtomSize DeviceSize
}

type PhysicalDeviceMemoryProperties {
	memoryTypeCount uint
	memoryTypes MemoryType
	memoryHeapCount uint
	memoryHeaps MemoryHeap
	memoryHeaps MemoryHeap
}

type PhysicalDeviceSparseProperties {
	residencyStandard2DBlockShape Bool32
	residencyStandard2DMultisampleBlockShape Bool32
	residencyStandard3DBlockShape Bool32
	residencyAlignedMipSize Bool32
	residencyNonResidentStrict Bool32
	residencyNonResidentStrict Bool32
}

type PhysicalDeviceProperties {
	apiVersion uint
	driverVersion uint
	vendorID uint
	deviceID uint
	deviceType PhysicalDeviceType
	deviceName byte
	pipelineCacheUUID ubyte
	limits PhysicalDeviceLimits
	sparseProperties PhysicalDeviceSparseProperties
	sparseProperties PhysicalDeviceSparseProperties
}

type QueueFamilyProperties {
	queueFlags QueueFlags
	queueCount uint
	timestampValidBits uint
	minImageTransferGranularity Extent3D
	minImageTransferGranularity Extent3D
}

type DeviceQueueCreateInfo {
	sType StructureType
	pNext *[]
	flags DeviceQueueCreateFlags
	queueFamilyIndex uint
	queueCount uint
	pQueuePriorities *real
	pQueuePriorities *real
}

type DeviceCreateInfo {
	sType StructureType
	pNext *[]
	flags DeviceCreateFlags
	queueCreateInfoCount uint
	pQueueCreateInfos *DeviceQueueCreateInfo
	enabledLayerCount uint
	ppEnabledLayerNames **byte
	enabledExtensionCount uint
	ppEnabledExtensionNames **byte
	pEnabledFeatures *PhysicalDeviceFeatures
	pEnabledFeatures *PhysicalDeviceFeatures
}

type ExtensionProperties {
	extensionName byte
	specVersion uint
	specVersion uint
}

type LayerProperties {
	layerName byte
	specVersion uint
	implementationVersion uint
	description byte
	description byte
}

type SubmitInfo {
	sType StructureType
	pNext *[]
	waitSemaphoreCount uint
	pWaitSemaphores *Semaphore
	pWaitDstStageMask *PipelineStageFlags
	commandBufferCount uint
	pCommandBuffers *CommandBuffer
	signalSemaphoreCount uint
	pSignalSemaphores *Semaphore
	pSignalSemaphores *Semaphore
}

type MappedMemoryRange {
	sType StructureType
	pNext *[]
	memory DeviceMemory
	offset DeviceSize
	size DeviceSize
	size DeviceSize
}

type MemoryAllocateInfo {
	sType StructureType
	pNext *[]
	allocationSize DeviceSize
	memoryTypeIndex uint
	memoryTypeIndex uint
}

type MemoryRequirements {
	size DeviceSize
	alignment DeviceSize
	memoryTypeBits uint
	memoryTypeBits uint
}

type SparseMemoryBind {
	resourceOffset DeviceSize
	size DeviceSize
	memory DeviceMemory
	memoryOffset DeviceSize
	flags SparseMemoryBindFlags
	flags SparseMemoryBindFlags
}

type SparseBufferMemoryBindInfo {
	buffer Buffer
	bindCount uint
	pBinds *SparseMemoryBind
	pBinds *SparseMemoryBind
}

type SparseImageOpaqueMemoryBindInfo {
	image Image
	bindCount uint
	pBinds *SparseMemoryBind
	pBinds *SparseMemoryBind
}

type ImageSubresource {
	aspectMask ImageAspectFlags
	mipLevel uint
	arrayLayer uint
	arrayLayer uint
}

type SparseImageMemoryBind {
	subresource ImageSubresource
	offset Offset3D
	extent Extent3D
	memory DeviceMemory
	memoryOffset DeviceSize
	flags SparseMemoryBindFlags
	flags SparseMemoryBindFlags
}

type SparseImageMemoryBindInfo {
	image Image
	bindCount uint
	pBinds *SparseImageMemoryBind
	pBinds *SparseImageMemoryBind
}

type BindSparseInfo {
	sType StructureType
	pNext *[]
	waitSemaphoreCount uint
	pWaitSemaphores *Semaphore
	bufferBindCount uint
	pBufferBinds *SparseBufferMemoryBindInfo
	imageOpaqueBindCount uint
	pImageOpaqueBinds *SparseImageOpaqueMemoryBindInfo
	imageBindCount uint
	pImageBinds *SparseImageMemoryBindInfo
	signalSemaphoreCount uint
	pSignalSemaphores *Semaphore
	pSignalSemaphores *Semaphore
}

type SparseImageFormatProperties {
	aspectMask ImageAspectFlags
	imageGranularity Extent3D
	flags SparseImageFormatFlags
	flags SparseImageFormatFlags
}

type SparseImageMemoryRequirements {
	formatProperties SparseImageFormatProperties
	imageMipTailFirstLod uint
	imageMipTailSize DeviceSize
	imageMipTailOffset DeviceSize
	imageMipTailStride DeviceSize
	imageMipTailStride DeviceSize
}

type FenceCreateInfo {
	sType StructureType
	pNext *[]
	flags FenceCreateFlags
	flags FenceCreateFlags
}

type SemaphoreCreateInfo {
	sType StructureType
	pNext *[]
	flags SemaphoreCreateFlags
	flags SemaphoreCreateFlags
}

type EventCreateInfo {
	sType StructureType
	pNext *[]
	flags EventCreateFlags
	flags EventCreateFlags
}

type QueryPoolCreateInfo {
	sType StructureType
	pNext *[]
	flags QueryPoolCreateFlags
	queryType QueryType
	queryCount uint
	pipelineStatistics QueryPipelineStatisticFlags
	pipelineStatistics QueryPipelineStatisticFlags
}

type BufferCreateInfo {
	sType StructureType
	pNext *[]
	flags BufferCreateFlags
	size DeviceSize
	usage BufferUsageFlags
	sharingMode SharingMode
	queueFamilyIndexCount uint
	pQueueFamilyIndices *uint
	pQueueFamilyIndices *uint
}

type BufferViewCreateInfo {
	sType StructureType
	pNext *[]
	flags BufferViewCreateFlags
	buffer Buffer
	format Format
	offset DeviceSize
	range DeviceSize
	range DeviceSize
}

type ImageCreateInfo {
	sType StructureType
	pNext *[]
	flags ImageCreateFlags
	imageType ImageType
	format Format
	extent Extent3D
	mipLevels uint
	arrayLayers uint
	samples SampleCountFlagBits
	tiling ImageTiling
	usage ImageUsageFlags
	sharingMode SharingMode
	queueFamilyIndexCount uint
	pQueueFamilyIndices *uint
	initialLayout ImageLayout
	initialLayout ImageLayout
}

type SubresourceLayout {
	offset DeviceSize
	size DeviceSize
	rowPitch DeviceSize
	arrayPitch DeviceSize
	depthPitch DeviceSize
	depthPitch DeviceSize
}

type ComponentMapping {
	r ComponentSwizzle
	g ComponentSwizzle
	b ComponentSwizzle
	a ComponentSwizzle
	a ComponentSwizzle
}

type ImageViewCreateInfo {
	sType StructureType
	pNext *[]
	flags ImageViewCreateFlags
	image Image
	viewType ImageViewType
	format Format
	components ComponentMapping
	subresourceRange ImageSubresourceRange
	subresourceRange ImageSubresourceRange
}

type ShaderModuleCreateInfo {
	sType StructureType
	pNext *[]
	flags ShaderModuleCreateFlags
	codeSize word
	pCode *uint
	pCode *uint
}

type PipelineCacheCreateInfo {
	sType StructureType
	pNext *[]
	flags PipelineCacheCreateFlags
	initialDataSize word
	pInitialData *[]
	pInitialData *[]
}

type SpecializationMapEntry {
	constantID uint
	offset uint
	size word
	size word
}

type SpecializationInfo {
	mapEntryCount uint
	pMapEntries *SpecializationMapEntry
	dataSize word
	pData *[]
	pData *[]
}

type PipelineShaderStageCreateInfo {
	sType StructureType
	pNext *[]
	flags PipelineShaderStageCreateFlags
	stage ShaderStageFlagBits
	module ShaderModule
	pName *byte
	pSpecializationInfo *SpecializationInfo
	pSpecializationInfo *SpecializationInfo
}

type ComputePipelineCreateInfo {
	sType StructureType
	pNext *[]
	flags PipelineCreateFlags
	stage PipelineShaderStageCreateInfo
	layout PipelineLayout
	basePipelineHandle Pipeline
	basePipelineIndex int
	basePipelineIndex int
}

type VertexInputBindingDescription {
	binding uint
	stride uint
	inputRate VertexInputRate
	inputRate VertexInputRate
}

type VertexInputAttributeDescription {
	location uint
	binding uint
	format Format
	offset uint
	offset uint
}

type PipelineVertexInputStateCreateInfo {
	sType StructureType
	pNext *[]
	flags PipelineVertexInputStateCreateFlags
	vertexBindingDescriptionCount uint
	pVertexBindingDescriptions *VertexInputBindingDescription
	vertexAttributeDescriptionCount uint
	pVertexAttributeDescriptions *VertexInputAttributeDescription
	pVertexAttributeDescriptions *VertexInputAttributeDescription
}

type PipelineInputAssemblyStateCreateInfo {
	sType StructureType
	pNext *[]
	flags PipelineInputAssemblyStateCreateFlags
	topology PrimitiveTopology
	primitiveRestartEnable Bool32
	primitiveRestartEnable Bool32
}

type PipelineTessellationStateCreateInfo {
	sType StructureType
	pNext *[]
	flags PipelineTessellationStateCreateFlags
	patchControlPoints uint
	patchControlPoints uint
}

type Viewport {
	x real
	y real
	width real
	height real
	minDepth real
	maxDepth real
	maxDepth real
}

type PipelineViewportStateCreateInfo {
	sType StructureType
	pNext *[]
	flags PipelineViewportStateCreateFlags
	viewportCount uint
	pViewports *Viewport
	scissorCount uint
	pScissors *Rect2D
	pScissors *Rect2D
}

type PipelineRasterizationStateCreateInfo {
	sType StructureType
	pNext *[]
	flags PipelineRasterizationStateCreateFlags
	depthClampEnable Bool32
	rasterizerDiscardEnable Bool32
	polygonMode PolygonMode
	cullMode CullModeFlags
	frontFace FrontFace
	depthBiasEnable Bool32
	depthBiasConstantFactor real
	depthBiasClamp real
	depthBiasSlopeFactor real
	lineWidth real
	lineWidth real
}

type PipelineMultisampleStateCreateInfo {
	sType StructureType
	pNext *[]
	flags PipelineMultisampleStateCreateFlags
	rasterizationSamples SampleCountFlagBits
	sampleShadingEnable Bool32
	minSampleShading real
	pSampleMask *SampleMask
	alphaToCoverageEnable Bool32
	alphaToOneEnable Bool32
	alphaToOneEnable Bool32
}

type StencilOpState {
	failOp StencilOp
	passOp StencilOp
	depthFailOp StencilOp
	compareOp CompareOp
	compareMask uint
	writeMask uint
	reference uint
	reference uint
}

type PipelineDepthStencilStateCreateInfo {
	sType StructureType
	pNext *[]
	flags PipelineDepthStencilStateCreateFlags
	depthTestEnable Bool32
	depthWriteEnable Bool32
	depthCompareOp CompareOp
	depthBoundsTestEnable Bool32
	stencilTestEnable Bool32
	front StencilOpState
	back StencilOpState
	minDepthBounds real
	maxDepthBounds real
	maxDepthBounds real
}

type PipelineColorBlendAttachmentState {
	blendEnable Bool32
	srcColorBlendFactor BlendFactor
	dstColorBlendFactor BlendFactor
	colorBlendOp BlendOp
	srcAlphaBlendFactor BlendFactor
	dstAlphaBlendFactor BlendFactor
	alphaBlendOp BlendOp
	colorWriteMask ColorComponentFlags
	colorWriteMask ColorComponentFlags
}

type PipelineColorBlendStateCreateInfo {
	sType StructureType
	pNext *[]
	flags PipelineColorBlendStateCreateFlags
	logicOpEnable Bool32
	logicOp LogicOp
	attachmentCount uint
	pAttachments *PipelineColorBlendAttachmentState
	blendConstants real
	blendConstants real
}

type PipelineDynamicStateCreateInfo {
	sType StructureType
	pNext *[]
	flags PipelineDynamicStateCreateFlags
	dynamicStateCount uint
	pDynamicStates *DynamicState
	pDynamicStates *DynamicState
}

type GraphicsPipelineCreateInfo {
	sType StructureType
	pNext *[]
	flags PipelineCreateFlags
	stageCount uint
	pStages *PipelineShaderStageCreateInfo
	pVertexInputState *PipelineVertexInputStateCreateInfo
	pInputAssemblyState *PipelineInputAssemblyStateCreateInfo
	pTessellationState *PipelineTessellationStateCreateInfo
	pViewportState *PipelineViewportStateCreateInfo
	pRasterizationState *PipelineRasterizationStateCreateInfo
	pMultisampleState *PipelineMultisampleStateCreateInfo
	pDepthStencilState *PipelineDepthStencilStateCreateInfo
	pColorBlendState *PipelineColorBlendStateCreateInfo
	pDynamicState *PipelineDynamicStateCreateInfo
	layout PipelineLayout
	renderPass RenderPass
	subpass uint
	basePipelineHandle Pipeline
	basePipelineIndex int
	basePipelineIndex int
}

type PushConstantRange {
	stageFlags ShaderStageFlags
	offset uint
	size uint
	size uint
}

type PipelineLayoutCreateInfo {
	sType StructureType
	pNext *[]
	flags PipelineLayoutCreateFlags
	setLayoutCount uint
	pSetLayouts *DescriptorSetLayout
	pushConstantRangeCount uint
	pPushConstantRanges *PushConstantRange
	pPushConstantRanges *PushConstantRange
}

type SamplerCreateInfo {
	sType StructureType
	pNext *[]
	flags SamplerCreateFlags
	magFilter Filter
	minFilter Filter
	mipmapMode SamplerMipmapMode
	addressModeU SamplerAddressMode
	addressModeV SamplerAddressMode
	addressModeW SamplerAddressMode
	mipLodBias real
	anisotropyEnable Bool32
	maxAnisotropy real
	compareEnable Bool32
	compareOp CompareOp
	minLod real
	maxLod real
	borderColor BorderColor
	unnormalizedCoordinates Bool32
	unnormalizedCoordinates Bool32
}

type CopyDescriptorSet {
	sType StructureType
	pNext *[]
	srcSet DescriptorSet
	srcBinding uint
	srcArrayElement uint
	dstSet DescriptorSet
	dstBinding uint
	dstArrayElement uint
	descriptorCount uint
	descriptorCount uint
}

type DescriptorBufferInfo {
	buffer Buffer
	offset DeviceSize
	range DeviceSize
	range DeviceSize
}

type DescriptorImageInfo {
	sampler Sampler
	imageView ImageView
	imageLayout ImageLayout
	imageLayout ImageLayout
}

type DescriptorPoolSize {
	ty DescriptorType
	descriptorCount uint
	descriptorCount uint
}

type DescriptorPoolCreateInfo {
	sType StructureType
	pNext *[]
	flags DescriptorPoolCreateFlags
	maxSets uint
	poolSizeCount uint
	pPoolSizes *DescriptorPoolSize
	pPoolSizes *DescriptorPoolSize
}

type DescriptorSetAllocateInfo {
	sType StructureType
	pNext *[]
	descriptorPool DescriptorPool
	descriptorSetCount uint
	pSetLayouts *DescriptorSetLayout
	pSetLayouts *DescriptorSetLayout
}

type DescriptorSetLayoutBinding {
	binding uint
	descriptorType DescriptorType
	descriptorCount uint
	stageFlags ShaderStageFlags
	pImmutableSamplers *Sampler
	pImmutableSamplers *Sampler
}

type DescriptorSetLayoutCreateInfo {
	sType StructureType
	pNext *[]
	flags DescriptorSetLayoutCreateFlags
	bindingCount uint
	pBindings *DescriptorSetLayoutBinding
	pBindings *DescriptorSetLayoutBinding
}

type WriteDescriptorSet {
	sType StructureType
	pNext *[]
	dstSet DescriptorSet
	dstBinding uint
	dstArrayElement uint
	descriptorCount uint
	descriptorType DescriptorType
	pImageInfo *DescriptorImageInfo
	pBufferInfo *DescriptorBufferInfo
	pTexelBufferView *BufferView
	pTexelBufferView *BufferView
}

type AttachmentDescription {
	flags AttachmentDescriptionFlags
	format Format
	samples SampleCountFlagBits
	loadOp AttachmentLoadOp
	storeOp AttachmentStoreOp
	stencilLoadOp AttachmentLoadOp
	stencilStoreOp AttachmentStoreOp
	initialLayout ImageLayout
	finalLayout ImageLayout
	finalLayout ImageLayout
}

type AttachmentReference {
	attachment uint
	layout ImageLayout
	layout ImageLayout
}

type FramebufferCreateInfo {
	sType StructureType
	pNext *[]
	flags FramebufferCreateFlags
	renderPass RenderPass
	attachmentCount uint
	pAttachments *ImageView
	width uint
	height uint
	layers uint
	layers uint
}

type SubpassDescription {
	flags SubpassDescriptionFlags
	pipelineBindPoint PipelineBindPoint
	inputAttachmentCount uint
	pInputAttachments *AttachmentReference
	colorAttachmentCount uint
	pColorAttachments *AttachmentReference
	pResolveAttachments *AttachmentReference
	pDepthStencilAttachment *AttachmentReference
	preserveAttachmentCount uint
	pPreserveAttachments *uint
	pPreserveAttachments *uint
}

type SubpassDependency {
	srcSubpass uint
	dstSubpass uint
	srcStageMask PipelineStageFlags
	dstStageMask PipelineStageFlags
	srcAccessMask AccessFlags
	dstAccessMask AccessFlags
	dependencyFlags DependencyFlags
	dependencyFlags DependencyFlags
}

type RenderPassCreateInfo {
	sType StructureType
	pNext *[]
	flags RenderPassCreateFlags
	attachmentCount uint
	pAttachments *AttachmentDescription
	subpassCount uint
	pSubpasses *SubpassDescription
	dependencyCount uint
	pDependencies *SubpassDependency
	pDependencies *SubpassDependency
}

type CommandPoolCreateInfo {
	sType StructureType
	pNext *[]
	flags CommandPoolCreateFlags
	queueFamilyIndex uint
	queueFamilyIndex uint
}

type CommandBufferAllocateInfo {
	sType StructureType
	pNext *[]
	commandPool CommandPool
	level CommandBufferLevel
	commandBufferCount uint
	commandBufferCount uint
}

type CommandBufferInheritanceInfo {
	sType StructureType
	pNext *[]
	renderPass RenderPass
	subpass uint
	framebuffer Framebuffer
	occlusionQueryEnable Bool32
	queryFlags QueryControlFlags
	pipelineStatistics QueryPipelineStatisticFlags
	pipelineStatistics QueryPipelineStatisticFlags
}

type CommandBufferBeginInfo {
	sType StructureType
	pNext *[]
	flags CommandBufferUsageFlags
	pInheritanceInfo *CommandBufferInheritanceInfo
	pInheritanceInfo *CommandBufferInheritanceInfo
}

type BufferCopy {
	srcOffset DeviceSize
	dstOffset DeviceSize
	size DeviceSize
	size DeviceSize
}

type ImageSubresourceLayers {
	aspectMask ImageAspectFlags
	mipLevel uint
	baseArrayLayer uint
	layerCount uint
	layerCount uint
}

type BufferImageCopy {
	bufferOffset DeviceSize
	bufferRowLength uint
	bufferImageHeight uint
	imageSubresource ImageSubresourceLayers
	imageOffset Offset3D
	imageExtent Extent3D
	imageExtent Extent3D
}

type ClearDepthStencilValue {
	depth real
	stencil uint
	stencil uint
}

type ClearAttachment {
	aspectMask ImageAspectFlags
	colorAttachment uint
	clearValue ClearValue
	clearValue ClearValue
}

type ClearRect {
	rect Rect2D
	baseArrayLayer uint
	layerCount uint
	layerCount uint
}

type ImageBlit {
	srcSubresource ImageSubresourceLayers
	srcOffsets Offset3D
	dstSubresource ImageSubresourceLayers
	dstOffsets Offset3D
	dstOffsets Offset3D
}

type ImageCopy {
	srcSubresource ImageSubresourceLayers
	srcOffset Offset3D
	dstSubresource ImageSubresourceLayers
	dstOffset Offset3D
	extent Extent3D
	extent Extent3D
}

type ImageResolve {
	srcSubresource ImageSubresourceLayers
	srcOffset Offset3D
	dstSubresource ImageSubresourceLayers
	dstOffset Offset3D
	extent Extent3D
	extent Extent3D
}

type RenderPassBeginInfo {
	sType StructureType
	pNext *[]
	renderPass RenderPass
	framebuffer Framebuffer
	renderArea Rect2D
	clearValueCount uint
	pClearValues *ClearValue
	pClearValues *ClearValue
}

type PhysicalDeviceSubgroupProperties {
	sType StructureType
	pNext *[]
	subgroupSize uint
	supportedStages ShaderStageFlags
	supportedOperations SubgroupFeatureFlags
	quadOperationsInAllStages Bool32
	quadOperationsInAllStages Bool32
}

type BindBufferMemoryInfo {
	sType StructureType
	pNext *[]
	buffer Buffer
	memory DeviceMemory
	memoryOffset DeviceSize
	memoryOffset DeviceSize
}

type BindImageMemoryInfo {
	sType StructureType
	pNext *[]
	image Image
	memory DeviceMemory
	memoryOffset DeviceSize
	memoryOffset DeviceSize
}

type PhysicalDevice16BitStorageFeatures {
	sType StructureType
	pNext *[]
	storageBuffer16BitAccess Bool32
	uniformAndStorageBuffer16BitAccess Bool32
	storagePushConstant16 Bool32
	storageInputOutput16 Bool32
	storageInputOutput16 Bool32
}

type MemoryDedicatedRequirements {
	sType StructureType
	pNext *[]
	prefersDedicatedAllocation Bool32
	requiresDedicatedAllocation Bool32
	requiresDedicatedAllocation Bool32
}

type MemoryDedicatedAllocateInfo {
	sType StructureType
	pNext *[]
	image Image
	buffer Buffer
	buffer Buffer
}

type MemoryAllocateFlagsInfo {
	sType StructureType
	pNext *[]
	flags MemoryAllocateFlags
	deviceMask uint
	deviceMask uint
}

type DeviceGroupRenderPassBeginInfo {
	sType StructureType
	pNext *[]
	deviceMask uint
	deviceRenderAreaCount uint
	pDeviceRenderAreas *Rect2D
	pDeviceRenderAreas *Rect2D
}

type DeviceGroupCommandBufferBeginInfo {
	sType StructureType
	pNext *[]
	deviceMask uint
	deviceMask uint
}

type DeviceGroupSubmitInfo {
	sType StructureType
	pNext *[]
	waitSemaphoreCount uint
	pWaitSemaphoreDeviceIndices *uint
	commandBufferCount uint
	pCommandBufferDeviceMasks *uint
	signalSemaphoreCount uint
	pSignalSemaphoreDeviceIndices *uint
	pSignalSemaphoreDeviceIndices *uint
}

type DeviceGroupBindSparseInfo {
	sType StructureType
	pNext *[]
	resourceDeviceIndex uint
	memoryDeviceIndex uint
	memoryDeviceIndex uint
}

type BindBufferMemoryDeviceGroupInfo {
	sType StructureType
	pNext *[]
	deviceIndexCount uint
	pDeviceIndices *uint
	pDeviceIndices *uint
}

type BindImageMemoryDeviceGroupInfo {
	sType StructureType
	pNext *[]
	deviceIndexCount uint
	pDeviceIndices *uint
	splitInstanceBindRegionCount uint
	pSplitInstanceBindRegions *Rect2D
	pSplitInstanceBindRegions *Rect2D
}

type PhysicalDeviceGroupProperties {
	sType StructureType
	pNext *[]
	physicalDeviceCount uint
	physicalDevices PhysicalDevice
	subsetAllocation Bool32
	subsetAllocation Bool32
}

type DeviceGroupDeviceCreateInfo {
	sType StructureType
	pNext *[]
	physicalDeviceCount uint
	pPhysicalDevices *PhysicalDevice
	pPhysicalDevices *PhysicalDevice
}

type BufferMemoryRequirementsInfo2 {
	sType StructureType
	pNext *[]
	buffer Buffer
	buffer Buffer
}

type ImageMemoryRequirementsInfo2 {
	sType StructureType
	pNext *[]
	image Image
	image Image
}

type ImageSparseMemoryRequirementsInfo2 {
	sType StructureType
	pNext *[]
	image Image
	image Image
}

type MemoryRequirements2 {
	sType StructureType
	pNext *[]
	memoryRequirements MemoryRequirements
	memoryRequirements MemoryRequirements
}

type SparseImageMemoryRequirements2 {
	sType StructureType
	pNext *[]
	memoryRequirements SparseImageMemoryRequirements
	memoryRequirements SparseImageMemoryRequirements
}

type PhysicalDeviceFeatures2 {
	sType StructureType
	pNext *[]
	features PhysicalDeviceFeatures
	features PhysicalDeviceFeatures
}

type PhysicalDeviceProperties2 {
	sType StructureType
	pNext *[]
	properties PhysicalDeviceProperties
	properties PhysicalDeviceProperties
}

type FormatProperties2 {
	sType StructureType
	pNext *[]
	formatProperties FormatProperties
	formatProperties FormatProperties
}

type ImageFormatProperties2 {
	sType StructureType
	pNext *[]
	imageFormatProperties ImageFormatProperties
	imageFormatProperties ImageFormatProperties
}

type PhysicalDeviceImageFormatInfo2 {
	sType StructureType
	pNext *[]
	format Format
	ty ImageType
	tiling ImageTiling
	usage ImageUsageFlags
	flags ImageCreateFlags
	flags ImageCreateFlags
}

type QueueFamilyProperties2 {
	sType StructureType
	pNext *[]
	queueFamilyProperties QueueFamilyProperties
	queueFamilyProperties QueueFamilyProperties
}

type PhysicalDeviceMemoryProperties2 {
	sType StructureType
	pNext *[]
	memoryProperties PhysicalDeviceMemoryProperties
	memoryProperties PhysicalDeviceMemoryProperties
}

type SparseImageFormatProperties2 {
	sType StructureType
	pNext *[]
	properties SparseImageFormatProperties
	properties SparseImageFormatProperties
}

type PhysicalDeviceSparseImageFormatInfo2 {
	sType StructureType
	pNext *[]
	format Format
	ty ImageType
	samples SampleCountFlagBits
	usage ImageUsageFlags
	tiling ImageTiling
	tiling ImageTiling
}

type PhysicalDevicePointClippingProperties {
	sType StructureType
	pNext *[]
	pointClippingBehavior PointClippingBehavior
	pointClippingBehavior PointClippingBehavior
}

type InputAttachmentAspectReference {
	subpass uint
	inputAttachmentIndex uint
	aspectMask ImageAspectFlags
	aspectMask ImageAspectFlags
}

type RenderPassInputAttachmentAspectCreateInfo {
	sType StructureType
	pNext *[]
	aspectReferenceCount uint
	pAspectReferences *InputAttachmentAspectReference
	pAspectReferences *InputAttachmentAspectReference
}

type ImageViewUsageCreateInfo {
	sType StructureType
	pNext *[]
	usage ImageUsageFlags
	usage ImageUsageFlags
}

type PipelineTessellationDomainOriginStateCreateInfo {
	sType StructureType
	pNext *[]
	domainOrigin TessellationDomainOrigin
	domainOrigin TessellationDomainOrigin
}

type RenderPassMultiviewCreateInfo {
	sType StructureType
	pNext *[]
	subpassCount uint
	pViewMasks *uint
	dependencyCount uint
	pViewOffsets *int
	correlationMaskCount uint
	pCorrelationMasks *uint
	pCorrelationMasks *uint
}

type PhysicalDeviceMultiviewFeatures {
	sType StructureType
	pNext *[]
	multiview Bool32
	multiviewGeometryShader Bool32
	multiviewTessellationShader Bool32
	multiviewTessellationShader Bool32
}

type PhysicalDeviceMultiviewProperties {
	sType StructureType
	pNext *[]
	maxMultiviewViewCount uint
	maxMultiviewInstanceIndex uint
	maxMultiviewInstanceIndex uint
}

type PhysicalDeviceVariablePointersFeatures {
	sType StructureType
	pNext *[]
	variablePointersStorageBuffer Bool32
	variablePointers Bool32
	variablePointers Bool32
}

type PhysicalDeviceProtectedMemoryFeatures {
	sType StructureType
	pNext *[]
	protectedMemory Bool32
	protectedMemory Bool32
}

type PhysicalDeviceProtectedMemoryProperties {
	sType StructureType
	pNext *[]
	protectedNoFault Bool32
	protectedNoFault Bool32
}

type DeviceQueueInfo2 {
	sType StructureType
	pNext *[]
	flags DeviceQueueCreateFlags
	queueFamilyIndex uint
	queueIndex uint
	queueIndex uint
}

type ProtectedSubmitInfo {
	sType StructureType
	pNext *[]
	protectedSubmit Bool32
	protectedSubmit Bool32
}

type SamplerYcbcrConversionCreateInfo {
	sType StructureType
	pNext *[]
	format Format
	ycbcrModel SamplerYcbcrModelConversion
	ycbcrRange SamplerYcbcrRange
	components ComponentMapping
	xChromaOffset ChromaLocation
	yChromaOffset ChromaLocation
	chromaFilter Filter
	forceExplicitReconstruction Bool32
	forceExplicitReconstruction Bool32
}

type SamplerYcbcrConversionInfo {
	sType StructureType
	pNext *[]
	conversion SamplerYcbcrConversion
	conversion SamplerYcbcrConversion
}

type BindImagePlaneMemoryInfo {
	sType StructureType
	pNext *[]
	planeAspect ImageAspectFlagBits
	planeAspect ImageAspectFlagBits
}

type ImagePlaneMemoryRequirementsInfo {
	sType StructureType
	pNext *[]
	planeAspect ImageAspectFlagBits
	planeAspect ImageAspectFlagBits
}

type PhysicalDeviceSamplerYcbcrConversionFeatures {
	sType StructureType
	pNext *[]
	samplerYcbcrConversion Bool32
	samplerYcbcrConversion Bool32
}

type SamplerYcbcrConversionImageFormatProperties {
	sType StructureType
	pNext *[]
	combinedImageSamplerDescriptorCount uint
	combinedImageSamplerDescriptorCount uint
}

type DescriptorUpdateTemplateEntry {
	dstBinding uint
	dstArrayElement uint
	descriptorCount uint
	descriptorType DescriptorType
	offset word
	stride word
	stride word
}

type DescriptorUpdateTemplateCreateInfo {
	sType StructureType
	pNext *[]
	flags DescriptorUpdateTemplateCreateFlags
	descriptorUpdateEntryCount uint
	pDescriptorUpdateEntries *DescriptorUpdateTemplateEntry
	templateType DescriptorUpdateTemplateType
	descriptorSetLayout DescriptorSetLayout
	pipelineBindPoint PipelineBindPoint
	pipelineLayout PipelineLayout
	set uint
	set uint
}

type ExternalMemoryProperties {
	externalMemoryFeatures ExternalMemoryFeatureFlags
	exportFromImportedHandleTypes ExternalMemoryHandleTypeFlags
	compatibleHandleTypes ExternalMemoryHandleTypeFlags
	compatibleHandleTypes ExternalMemoryHandleTypeFlags
}

type PhysicalDeviceExternalImageFormatInfo {
	sType StructureType
	pNext *[]
	handleType ExternalMemoryHandleTypeFlagBits
	handleType ExternalMemoryHandleTypeFlagBits
}

type ExternalImageFormatProperties {
	sType StructureType
	pNext *[]
	externalMemoryProperties ExternalMemoryProperties
	externalMemoryProperties ExternalMemoryProperties
}

type PhysicalDeviceExternalBufferInfo {
	sType StructureType
	pNext *[]
	flags BufferCreateFlags
	usage BufferUsageFlags
	handleType ExternalMemoryHandleTypeFlagBits
	handleType ExternalMemoryHandleTypeFlagBits
}

type ExternalBufferProperties {
	sType StructureType
	pNext *[]
	externalMemoryProperties ExternalMemoryProperties
	externalMemoryProperties ExternalMemoryProperties
}

type PhysicalDeviceIDProperties {
	sType StructureType
	pNext *[]
	deviceUUID ubyte
	driverUUID ubyte
	deviceLUID ubyte
	deviceNodeMask uint
	deviceLUIDValid Bool32
	deviceLUIDValid Bool32
}

type ExternalMemoryImageCreateInfo {
	sType StructureType
	pNext *[]
	handleTypes ExternalMemoryHandleTypeFlags
	handleTypes ExternalMemoryHandleTypeFlags
}

type ExternalMemoryBufferCreateInfo {
	sType StructureType
	pNext *[]
	handleTypes ExternalMemoryHandleTypeFlags
	handleTypes ExternalMemoryHandleTypeFlags
}

type ExportMemoryAllocateInfo {
	sType StructureType
	pNext *[]
	handleTypes ExternalMemoryHandleTypeFlags
	handleTypes ExternalMemoryHandleTypeFlags
}

type PhysicalDeviceExternalFenceInfo {
	sType StructureType
	pNext *[]
	handleType ExternalFenceHandleTypeFlagBits
	handleType ExternalFenceHandleTypeFlagBits
}

type ExternalFenceProperties {
	sType StructureType
	pNext *[]
	exportFromImportedHandleTypes ExternalFenceHandleTypeFlags
	compatibleHandleTypes ExternalFenceHandleTypeFlags
	externalFenceFeatures ExternalFenceFeatureFlags
	externalFenceFeatures ExternalFenceFeatureFlags
}

type ExportFenceCreateInfo {
	sType StructureType
	pNext *[]
	handleTypes ExternalFenceHandleTypeFlags
	handleTypes ExternalFenceHandleTypeFlags
}

type ExportSemaphoreCreateInfo {
	sType StructureType
	pNext *[]
	handleTypes ExternalSemaphoreHandleTypeFlags
	handleTypes ExternalSemaphoreHandleTypeFlags
}

type PhysicalDeviceExternalSemaphoreInfo {
	sType StructureType
	pNext *[]
	handleType ExternalSemaphoreHandleTypeFlagBits
	handleType ExternalSemaphoreHandleTypeFlagBits
}

type ExternalSemaphoreProperties {
	sType StructureType
	pNext *[]
	exportFromImportedHandleTypes ExternalSemaphoreHandleTypeFlags
	compatibleHandleTypes ExternalSemaphoreHandleTypeFlags
	externalSemaphoreFeatures ExternalSemaphoreFeatureFlags
	externalSemaphoreFeatures ExternalSemaphoreFeatureFlags
}

type PhysicalDeviceMaintenance3Properties {
	sType StructureType
	pNext *[]
	maxPerSetDescriptors uint
	maxMemoryAllocationSize DeviceSize
	maxMemoryAllocationSize DeviceSize
}

type DescriptorSetLayoutSupport {
	sType StructureType
	pNext *[]
	supported Bool32
	supported Bool32
}

type PhysicalDeviceShaderDrawParametersFeatures {
	sType StructureType
	pNext *[]
	shaderDrawParameters Bool32
	shaderDrawParameters Bool32
}

type PhysicalDeviceVulkan11Features {
	sType StructureType
	pNext *[]
	storageBuffer16BitAccess Bool32
	uniformAndStorageBuffer16BitAccess Bool32
	storagePushConstant16 Bool32
	storageInputOutput16 Bool32
	multiview Bool32
	multiviewGeometryShader Bool32
	multiviewTessellationShader Bool32
	variablePointersStorageBuffer Bool32
	variablePointers Bool32
	protectedMemory Bool32
	samplerYcbcrConversion Bool32
	shaderDrawParameters Bool32
	shaderDrawParameters Bool32
}

type PhysicalDeviceVulkan11Properties {
	sType StructureType
	pNext *[]
	deviceUUID ubyte
	driverUUID ubyte
	deviceLUID ubyte
	deviceNodeMask uint
	deviceLUIDValid Bool32
	subgroupSize uint
	subgroupSupportedStages ShaderStageFlags
	subgroupSupportedOperations SubgroupFeatureFlags
	subgroupQuadOperationsInAllStages Bool32
	pointClippingBehavior PointClippingBehavior
	maxMultiviewViewCount uint
	maxMultiviewInstanceIndex uint
	protectedNoFault Bool32
	maxPerSetDescriptors uint
	maxMemoryAllocationSize DeviceSize
	maxMemoryAllocationSize DeviceSize
}

type PhysicalDeviceVulkan12Features {
	sType StructureType
	pNext *[]
	samplerMirrorClampToEdge Bool32
	drawIndirectCount Bool32
	storageBuffer8BitAccess Bool32
	uniformAndStorageBuffer8BitAccess Bool32
	storagePushConstant8 Bool32
	shaderBufferInt64Atomics Bool32
	shaderSharedInt64Atomics Bool32
	shaderFloat16 Bool32
	shaderInt8 Bool32
	descriptorIndexing Bool32
	shaderInputAttachmentArrayDynamicIndexing Bool32
	shaderUniformTexelBufferArrayDynamicIndexing Bool32
	shaderStorageTexelBufferArrayDynamicIndexing Bool32
	shaderUniformBufferArrayNonUniformIndexing Bool32
	shaderSampledImageArrayNonUniformIndexing Bool32
	shaderStorageBufferArrayNonUniformIndexing Bool32
	shaderStorageImageArrayNonUniformIndexing Bool32
	shaderInputAttachmentArrayNonUniformIndexing Bool32
	shaderUniformTexelBufferArrayNonUniformIndexing Bool32
	shaderStorageTexelBufferArrayNonUniformIndexing Bool32
	descriptorBindingUniformBufferUpdateAfterBind Bool32
	descriptorBindingSampledImageUpdateAfterBind Bool32
	descriptorBindingStorageImageUpdateAfterBind Bool32
	descriptorBindingStorageBufferUpdateAfterBind Bool32
	descriptorBindingUniformTexelBufferUpdateAfterBind Bool32
	descriptorBindingStorageTexelBufferUpdateAfterBind Bool32
	descriptorBindingUpdateUnusedWhilePending Bool32
	descriptorBindingPartiallyBound Bool32
	descriptorBindingVariableDescriptorCount Bool32
	runtimeDescriptorArray Bool32
	samplerFilterMinmax Bool32
	scalarBlockLayout Bool32
	imagelessFramebuffer Bool32
	uniformBufferStandardLayout Bool32
	shaderSubgroupExtendedTypes Bool32
	separateDepthStencilLayouts Bool32
	hostQueryReset Bool32
	timelineSemaphore Bool32
	bufferDeviceAddress Bool32
	bufferDeviceAddressCaptureReplay Bool32
	bufferDeviceAddressMultiDevice Bool32
	vulkanMemoryModel Bool32
	vulkanMemoryModelDeviceScope Bool32
	vulkanMemoryModelAvailabilityVisibilityChains Bool32
	shaderOutputViewportIndex Bool32
	shaderOutputLayer Bool32
	subgroupBroadcastDynamicId Bool32
	subgroupBroadcastDynamicId Bool32
}

type ConformanceVersion {
	major ubyte
	minor ubyte
	subminor ubyte
	patch ubyte
	patch ubyte
}

type PhysicalDeviceVulkan12Properties {
	sType StructureType
	pNext *[]
	driverID DriverId
	driverName byte
	driverInfo byte
	conformanceVersion ConformanceVersion
	denormBehaviorIndependence ShaderFloatControlsIndependence
	roundingModeIndependence ShaderFloatControlsIndependence
	shaderSignedZeroInfNanPreserveFloat16 Bool32
	shaderSignedZeroInfNanPreserveFloat32 Bool32
	shaderSignedZeroInfNanPreserveFloat64 Bool32
	shaderDenormPreserveFloat16 Bool32
	shaderDenormPreserveFloat32 Bool32
	shaderDenormPreserveFloat64 Bool32
	shaderDenormFlushToZeroFloat16 Bool32
	shaderDenormFlushToZeroFloat32 Bool32
	shaderDenormFlushToZeroFloat64 Bool32
	shaderRoundingModeRTEFloat16 Bool32
	shaderRoundingModeRTEFloat32 Bool32
	shaderRoundingModeRTEFloat64 Bool32
	shaderRoundingModeRTZFloat16 Bool32
	shaderRoundingModeRTZFloat32 Bool32
	shaderRoundingModeRTZFloat64 Bool32
	maxUpdateAfterBindDescriptorsInAllPools uint
	shaderUniformBufferArrayNonUniformIndexingNative Bool32
	shaderSampledImageArrayNonUniformIndexingNative Bool32
	shaderStorageBufferArrayNonUniformIndexingNative Bool32
	shaderStorageImageArrayNonUniformIndexingNative Bool32
	shaderInputAttachmentArrayNonUniformIndexingNative Bool32
	robustBufferAccessUpdateAfterBind Bool32
	quadDivergentImplicitLod Bool32
	maxPerStageDescriptorUpdateAfterBindSamplers uint
	maxPerStageDescriptorUpdateAfterBindUniformBuffers uint
	maxPerStageDescriptorUpdateAfterBindStorageBuffers uint
	maxPerStageDescriptorUpdateAfterBindSampledImages uint
	maxPerStageDescriptorUpdateAfterBindStorageImages uint
	maxPerStageDescriptorUpdateAfterBindInputAttachments uint
	maxPerStageUpdateAfterBindResources uint
	maxDescriptorSetUpdateAfterBindSamplers uint
	maxDescriptorSetUpdateAfterBindUniformBuffers uint
	maxDescriptorSetUpdateAfterBindUniformBuffersDynamic uint
	maxDescriptorSetUpdateAfterBindStorageBuffers uint
	maxDescriptorSetUpdateAfterBindStorageBuffersDynamic uint
	maxDescriptorSetUpdateAfterBindSampledImages uint
	maxDescriptorSetUpdateAfterBindStorageImages uint
	maxDescriptorSetUpdateAfterBindInputAttachments uint
	supportedDepthResolveModes ResolveModeFlags
	supportedStencilResolveModes ResolveModeFlags
	independentResolveNone Bool32
	independentResolve Bool32
	filterMinmaxSingleComponentFormats Bool32
	filterMinmaxImageComponentMapping Bool32
	maxTimelineSemaphoreValueDifference ulong
	framebufferIntegerColorSampleCounts SampleCountFlags
	framebufferIntegerColorSampleCounts SampleCountFlags
}

type ImageFormatListCreateInfo {
	sType StructureType
	pNext *[]
	viewFormatCount uint
	pViewFormats *Format
	pViewFormats *Format
}

type AttachmentDescription2 {
	sType StructureType
	pNext *[]
	flags AttachmentDescriptionFlags
	format Format
	samples SampleCountFlagBits
	loadOp AttachmentLoadOp
	storeOp AttachmentStoreOp
	stencilLoadOp AttachmentLoadOp
	stencilStoreOp AttachmentStoreOp
	initialLayout ImageLayout
	finalLayout ImageLayout
	finalLayout ImageLayout
}

type AttachmentReference2 {
	sType StructureType
	pNext *[]
	attachment uint
	layout ImageLayout
	aspectMask ImageAspectFlags
	aspectMask ImageAspectFlags
}

type SubpassDescription2 {
	sType StructureType
	pNext *[]
	flags SubpassDescriptionFlags
	pipelineBindPoint PipelineBindPoint
	viewMask uint
	inputAttachmentCount uint
	pInputAttachments *AttachmentReference2
	colorAttachmentCount uint
	pColorAttachments *AttachmentReference2
	pResolveAttachments *AttachmentReference2
	pDepthStencilAttachment *AttachmentReference2
	preserveAttachmentCount uint
	pPreserveAttachments *uint
	pPreserveAttachments *uint
}

type SubpassDependency2 {
	sType StructureType
	pNext *[]
	srcSubpass uint
	dstSubpass uint
	srcStageMask PipelineStageFlags
	dstStageMask PipelineStageFlags
	srcAccessMask AccessFlags
	dstAccessMask AccessFlags
	dependencyFlags DependencyFlags
	viewOffset int
	viewOffset int
}

type RenderPassCreateInfo2 {
	sType StructureType
	pNext *[]
	flags RenderPassCreateFlags
	attachmentCount uint
	pAttachments *AttachmentDescription2
	subpassCount uint
	pSubpasses *SubpassDescription2
	dependencyCount uint
	pDependencies *SubpassDependency2
	correlatedViewMaskCount uint
	pCorrelatedViewMasks *uint
	pCorrelatedViewMasks *uint
}

type SubpassBeginInfo {
	sType StructureType
	pNext *[]
	contents SubpassContents
	contents SubpassContents
}

type SubpassEndInfo {
	sType StructureType
	pNext *[]
	pNext *[]
}

type PhysicalDevice8BitStorageFeatures {
	sType StructureType
	pNext *[]
	storageBuffer8BitAccess Bool32
	uniformAndStorageBuffer8BitAccess Bool32
	storagePushConstant8 Bool32
	storagePushConstant8 Bool32
}

type PhysicalDeviceDriverProperties {
	sType StructureType
	pNext *[]
	driverID DriverId
	driverName byte
	driverInfo byte
	conformanceVersion ConformanceVersion
	conformanceVersion ConformanceVersion
}

type PhysicalDeviceShaderAtomicInt64Features {
	sType StructureType
	pNext *[]
	shaderBufferInt64Atomics Bool32
	shaderSharedInt64Atomics Bool32
	shaderSharedInt64Atomics Bool32
}

type PhysicalDeviceShaderFloat16Int8Features {
	sType StructureType
	pNext *[]
	shaderFloat16 Bool32
	shaderInt8 Bool32
	shaderInt8 Bool32
}

type PhysicalDeviceFloatControlsProperties {
	sType StructureType
	pNext *[]
	denormBehaviorIndependence ShaderFloatControlsIndependence
	roundingModeIndependence ShaderFloatControlsIndependence
	shaderSignedZeroInfNanPreserveFloat16 Bool32
	shaderSignedZeroInfNanPreserveFloat32 Bool32
	shaderSignedZeroInfNanPreserveFloat64 Bool32
	shaderDenormPreserveFloat16 Bool32
	shaderDenormPreserveFloat32 Bool32
	shaderDenormPreserveFloat64 Bool32
	shaderDenormFlushToZeroFloat16 Bool32
	shaderDenormFlushToZeroFloat32 Bool32
	shaderDenormFlushToZeroFloat64 Bool32
	shaderRoundingModeRTEFloat16 Bool32
	shaderRoundingModeRTEFloat32 Bool32
	shaderRoundingModeRTEFloat64 Bool32
	shaderRoundingModeRTZFloat16 Bool32
	shaderRoundingModeRTZFloat32 Bool32
	shaderRoundingModeRTZFloat64 Bool32
	shaderRoundingModeRTZFloat64 Bool32
}

type DescriptorSetLayoutBindingFlagsCreateInfo {
	sType StructureType
	pNext *[]
	bindingCount uint
	pBindingFlags *DescriptorBindingFlags
	pBindingFlags *DescriptorBindingFlags
}

type PhysicalDeviceDescriptorIndexingFeatures {
	sType StructureType
	pNext *[]
	shaderInputAttachmentArrayDynamicIndexing Bool32
	shaderUniformTexelBufferArrayDynamicIndexing Bool32
	shaderStorageTexelBufferArrayDynamicIndexing Bool32
	shaderUniformBufferArrayNonUniformIndexing Bool32
	shaderSampledImageArrayNonUniformIndexing Bool32
	shaderStorageBufferArrayNonUniformIndexing Bool32
	shaderStorageImageArrayNonUniformIndexing Bool32
	shaderInputAttachmentArrayNonUniformIndexing Bool32
	shaderUniformTexelBufferArrayNonUniformIndexing Bool32
	shaderStorageTexelBufferArrayNonUniformIndexing Bool32
	descriptorBindingUniformBufferUpdateAfterBind Bool32
	descriptorBindingSampledImageUpdateAfterBind Bool32
	descriptorBindingStorageImageUpdateAfterBind Bool32
	descriptorBindingStorageBufferUpdateAfterBind Bool32
	descriptorBindingUniformTexelBufferUpdateAfterBind Bool32
	descriptorBindingStorageTexelBufferUpdateAfterBind Bool32
	descriptorBindingUpdateUnusedWhilePending Bool32
	descriptorBindingPartiallyBound Bool32
	descriptorBindingVariableDescriptorCount Bool32
	runtimeDescriptorArray Bool32
	runtimeDescriptorArray Bool32
}

type PhysicalDeviceDescriptorIndexingProperties {
	sType StructureType
	pNext *[]
	maxUpdateAfterBindDescriptorsInAllPools uint
	shaderUniformBufferArrayNonUniformIndexingNative Bool32
	shaderSampledImageArrayNonUniformIndexingNative Bool32
	shaderStorageBufferArrayNonUniformIndexingNative Bool32
	shaderStorageImageArrayNonUniformIndexingNative Bool32
	shaderInputAttachmentArrayNonUniformIndexingNative Bool32
	robustBufferAccessUpdateAfterBind Bool32
	quadDivergentImplicitLod Bool32
	maxPerStageDescriptorUpdateAfterBindSamplers uint
	maxPerStageDescriptorUpdateAfterBindUniformBuffers uint
	maxPerStageDescriptorUpdateAfterBindStorageBuffers uint
	maxPerStageDescriptorUpdateAfterBindSampledImages uint
	maxPerStageDescriptorUpdateAfterBindStorageImages uint
	maxPerStageDescriptorUpdateAfterBindInputAttachments uint
	maxPerStageUpdateAfterBindResources uint
	maxDescriptorSetUpdateAfterBindSamplers uint
	maxDescriptorSetUpdateAfterBindUniformBuffers uint
	maxDescriptorSetUpdateAfterBindUniformBuffersDynamic uint
	maxDescriptorSetUpdateAfterBindStorageBuffers uint
	maxDescriptorSetUpdateAfterBindStorageBuffersDynamic uint
	maxDescriptorSetUpdateAfterBindSampledImages uint
	maxDescriptorSetUpdateAfterBindStorageImages uint
	maxDescriptorSetUpdateAfterBindInputAttachments uint
	maxDescriptorSetUpdateAfterBindInputAttachments uint
}

type DescriptorSetVariableDescriptorCountAllocateInfo {
	sType StructureType
	pNext *[]
	descriptorSetCount uint
	pDescriptorCounts *uint
	pDescriptorCounts *uint
}

type DescriptorSetVariableDescriptorCountLayoutSupport {
	sType StructureType
	pNext *[]
	maxVariableDescriptorCount uint
	maxVariableDescriptorCount uint
}

type SubpassDescriptionDepthStencilResolve {
	sType StructureType
	pNext *[]
	depthResolveMode ResolveModeFlagBits
	stencilResolveMode ResolveModeFlagBits
	pDepthStencilResolveAttachment *AttachmentReference2
	pDepthStencilResolveAttachment *AttachmentReference2
}

type PhysicalDeviceDepthStencilResolveProperties {
	sType StructureType
	pNext *[]
	supportedDepthResolveModes ResolveModeFlags
	supportedStencilResolveModes ResolveModeFlags
	independentResolveNone Bool32
	independentResolve Bool32
	independentResolve Bool32
}

type PhysicalDeviceScalarBlockLayoutFeatures {
	sType StructureType
	pNext *[]
	scalarBlockLayout Bool32
	scalarBlockLayout Bool32
}

type ImageStencilUsageCreateInfo {
	sType StructureType
	pNext *[]
	stencilUsage ImageUsageFlags
	stencilUsage ImageUsageFlags
}

type SamplerReductionModeCreateInfo {
	sType StructureType
	pNext *[]
	reductionMode SamplerReductionMode
	reductionMode SamplerReductionMode
}

type PhysicalDeviceSamplerFilterMinmaxProperties {
	sType StructureType
	pNext *[]
	filterMinmaxSingleComponentFormats Bool32
	filterMinmaxImageComponentMapping Bool32
	filterMinmaxImageComponentMapping Bool32
}

type PhysicalDeviceVulkanMemoryModelFeatures {
	sType StructureType
	pNext *[]
	vulkanMemoryModel Bool32
	vulkanMemoryModelDeviceScope Bool32
	vulkanMemoryModelAvailabilityVisibilityChains Bool32
	vulkanMemoryModelAvailabilityVisibilityChains Bool32
}

type PhysicalDeviceImagelessFramebufferFeatures {
	sType StructureType
	pNext *[]
	imagelessFramebuffer Bool32
	imagelessFramebuffer Bool32
}

type FramebufferAttachmentImageInfo {
	sType StructureType
	pNext *[]
	flags ImageCreateFlags
	usage ImageUsageFlags
	width uint
	height uint
	layerCount uint
	viewFormatCount uint
	pViewFormats *Format
	pViewFormats *Format
}

type FramebufferAttachmentsCreateInfo {
	sType StructureType
	pNext *[]
	attachmentImageInfoCount uint
	pAttachmentImageInfos *FramebufferAttachmentImageInfo
	pAttachmentImageInfos *FramebufferAttachmentImageInfo
}

type RenderPassAttachmentBeginInfo {
	sType StructureType
	pNext *[]
	attachmentCount uint
	pAttachments *ImageView
	pAttachments *ImageView
}

type PhysicalDeviceUniformBufferStandardLayoutFeatures {
	sType StructureType
	pNext *[]
	uniformBufferStandardLayout Bool32
	uniformBufferStandardLayout Bool32
}

type PhysicalDeviceShaderSubgroupExtendedTypesFeatures {
	sType StructureType
	pNext *[]
	shaderSubgroupExtendedTypes Bool32
	shaderSubgroupExtendedTypes Bool32
}

type PhysicalDeviceSeparateDepthStencilLayoutsFeatures {
	sType StructureType
	pNext *[]
	separateDepthStencilLayouts Bool32
	separateDepthStencilLayouts Bool32
}

type AttachmentReferenceStencilLayout {
	sType StructureType
	pNext *[]
	stencilLayout ImageLayout
	stencilLayout ImageLayout
}

type AttachmentDescriptionStencilLayout {
	sType StructureType
	pNext *[]
	stencilInitialLayout ImageLayout
	stencilFinalLayout ImageLayout
	stencilFinalLayout ImageLayout
}

type PhysicalDeviceHostQueryResetFeatures {
	sType StructureType
	pNext *[]
	hostQueryReset Bool32
	hostQueryReset Bool32
}

type PhysicalDeviceTimelineSemaphoreFeatures {
	sType StructureType
	pNext *[]
	timelineSemaphore Bool32
	timelineSemaphore Bool32
}

type PhysicalDeviceTimelineSemaphoreProperties {
	sType StructureType
	pNext *[]
	maxTimelineSemaphoreValueDifference ulong
	maxTimelineSemaphoreValueDifference ulong
}

type SemaphoreTypeCreateInfo {
	sType StructureType
	pNext *[]
	semaphoreType SemaphoreType
	initialValue ulong
	initialValue ulong
}

type TimelineSemaphoreSubmitInfo {
	sType StructureType
	pNext *[]
	waitSemaphoreValueCount uint
	pWaitSemaphoreValues *ulong
	signalSemaphoreValueCount uint
	pSignalSemaphoreValues *ulong
	pSignalSemaphoreValues *ulong
}

type SemaphoreWaitInfo {
	sType StructureType
	pNext *[]
	flags SemaphoreWaitFlags
	semaphoreCount uint
	pSemaphores *Semaphore
	pValues *ulong
	pValues *ulong
}

type SemaphoreSignalInfo {
	sType StructureType
	pNext *[]
	semaphore Semaphore
	value ulong
	value ulong
}

type PhysicalDeviceBufferDeviceAddressFeatures {
	sType StructureType
	pNext *[]
	bufferDeviceAddress Bool32
	bufferDeviceAddressCaptureReplay Bool32
	bufferDeviceAddressMultiDevice Bool32
	bufferDeviceAddressMultiDevice Bool32
}

type BufferDeviceAddressInfo {
	sType StructureType
	pNext *[]
	buffer Buffer
	buffer Buffer
}

type BufferOpaqueCaptureAddressCreateInfo {
	sType StructureType
	pNext *[]
	opaqueCaptureAddress ulong
	opaqueCaptureAddress ulong
}

type MemoryOpaqueCaptureAddressAllocateInfo {
	sType StructureType
	pNext *[]
	opaqueCaptureAddress ulong
	opaqueCaptureAddress ulong
}

type DeviceMemoryOpaqueCaptureAddressInfo {
	sType StructureType
	pNext *[]
	memory DeviceMemory
	memory DeviceMemory
}

type SurfaceCapabilitiesKHR {
	minImageCount uint
	maxImageCount uint
	currentExtent Extent2D
	minImageExtent Extent2D
	maxImageExtent Extent2D
	maxImageArrayLayers uint
	supportedTransforms SurfaceTransformFlagsKHR
	currentTransform SurfaceTransformFlagBitsKHR
	supportedCompositeAlpha CompositeAlphaFlagsKHR
	supportedUsageFlags ImageUsageFlags
	supportedUsageFlags ImageUsageFlags
}

type SurfaceFormatKHR {
	format Format
	colorSpace ColorSpaceKHR
	colorSpace ColorSpaceKHR
}

type SwapchainCreateInfoKHR {
	sType StructureType
	pNext *[]
	flags SwapchainCreateFlagsKHR
	surface SurfaceKHR
	minImageCount uint
	imageFormat Format
	imageColorSpace ColorSpaceKHR
	imageExtent Extent2D
	imageArrayLayers uint
	imageUsage ImageUsageFlags
	imageSharingMode SharingMode
	queueFamilyIndexCount uint
	pQueueFamilyIndices *uint
	preTransform SurfaceTransformFlagBitsKHR
	compositeAlpha CompositeAlphaFlagBitsKHR
	presentMode PresentModeKHR
	clipped Bool32
	oldSwapchain SwapchainKHR
	oldSwapchain SwapchainKHR
}

type PresentInfoKHR {
	sType StructureType
	pNext *[]
	waitSemaphoreCount uint
	pWaitSemaphores *Semaphore
	swapchainCount uint
	pSwapchains *SwapchainKHR
	pImageIndices *uint
	pResults *Result
	pResults *Result
}

type ImageSwapchainCreateInfoKHR {
	sType StructureType
	pNext *[]
	swapchain SwapchainKHR
	swapchain SwapchainKHR
}

type BindImageMemorySwapchainInfoKHR {
	sType StructureType
	pNext *[]
	swapchain SwapchainKHR
	imageIndex uint
	imageIndex uint
}

type AcquireNextImageInfoKHR {
	sType StructureType
	pNext *[]
	swapchain SwapchainKHR
	timeout ulong
	semaphore Semaphore
	fence Fence
	deviceMask uint
	deviceMask uint
}

type DeviceGroupPresentCapabilitiesKHR {
	sType StructureType
	pNext *[]
	presentMask uint
	modes DeviceGroupPresentModeFlagsKHR
	modes DeviceGroupPresentModeFlagsKHR
}

type DeviceGroupPresentInfoKHR {
	sType StructureType
	pNext *[]
	swapchainCount uint
	pDeviceMasks *uint
	mode DeviceGroupPresentModeFlagBitsKHR
	mode DeviceGroupPresentModeFlagBitsKHR
}

type DeviceGroupSwapchainCreateInfoKHR {
	sType StructureType
	pNext *[]
	modes DeviceGroupPresentModeFlagsKHR
	modes DeviceGroupPresentModeFlagsKHR
}

type DisplayModeParametersKHR {
	visibleRegion Extent2D
	refreshRate uint
	refreshRate uint
}

type DisplayModeCreateInfoKHR {
	sType StructureType
	pNext *[]
	flags DisplayModeCreateFlagsKHR
	parameters DisplayModeParametersKHR
	parameters DisplayModeParametersKHR
}

type DisplayModePropertiesKHR {
	displayMode DisplayModeKHR
	parameters DisplayModeParametersKHR
	parameters DisplayModeParametersKHR
}

type DisplayPlaneCapabilitiesKHR {
	supportedAlpha DisplayPlaneAlphaFlagsKHR
	minSrcPosition Offset2D
	maxSrcPosition Offset2D
	minSrcExtent Extent2D
	maxSrcExtent Extent2D
	minDstPosition Offset2D
	maxDstPosition Offset2D
	minDstExtent Extent2D
	maxDstExtent Extent2D
	maxDstExtent Extent2D
}

type DisplayPlanePropertiesKHR {
	currentDisplay DisplayKHR
	currentStackIndex uint
	currentStackIndex uint
}

type DisplayPropertiesKHR {
	display DisplayKHR
	displayName *byte
	physicalDimensions Extent2D
	physicalResolution Extent2D
	supportedTransforms SurfaceTransformFlagsKHR
	planeReorderPossible Bool32
	persistentContent Bool32
	persistentContent Bool32
}

type DisplaySurfaceCreateInfoKHR {
	sType StructureType
	pNext *[]
	flags DisplaySurfaceCreateFlagsKHR
	displayMode DisplayModeKHR
	planeIndex uint
	planeStackIndex uint
	transform SurfaceTransformFlagBitsKHR
	globalAlpha real
	alphaMode DisplayPlaneAlphaFlagBitsKHR
	imageExtent Extent2D
	imageExtent Extent2D
}

type DisplayPresentInfoKHR {
	sType StructureType
	pNext *[]
	srcRect Rect2D
	dstRect Rect2D
	persistent Bool32
	persistent Bool32
}

type ImportMemoryFdInfoKHR {
	sType StructureType
	pNext *[]
	handleType ExternalMemoryHandleTypeFlagBits
	fd int
	fd int
}

type MemoryFdPropertiesKHR {
	sType StructureType
	pNext *[]
	memoryTypeBits uint
	memoryTypeBits uint
}

type MemoryGetFdInfoKHR {
	sType StructureType
	pNext *[]
	memory DeviceMemory
	handleType ExternalMemoryHandleTypeFlagBits
	handleType ExternalMemoryHandleTypeFlagBits
}

type ImportSemaphoreFdInfoKHR {
	sType StructureType
	pNext *[]
	semaphore Semaphore
	flags SemaphoreImportFlags
	handleType ExternalSemaphoreHandleTypeFlagBits
	fd int
	fd int
}

type SemaphoreGetFdInfoKHR {
	sType StructureType
	pNext *[]
	semaphore Semaphore
	handleType ExternalSemaphoreHandleTypeFlagBits
	handleType ExternalSemaphoreHandleTypeFlagBits
}

type PhysicalDevicePushDescriptorPropertiesKHR {
	sType StructureType
	pNext *[]
	maxPushDescriptors uint
	maxPushDescriptors uint
}

type RectLayerKHR {
	offset Offset2D
	extent Extent2D
	layer uint
	layer uint
}

type PresentRegionKHR {
	rectangleCount uint
	pRectangles *RectLayerKHR
	pRectangles *RectLayerKHR
}

type PresentRegionsKHR {
	sType StructureType
	pNext *[]
	swapchainCount uint
	pRegions *PresentRegionKHR
	pRegions *PresentRegionKHR
}

type SharedPresentSurfaceCapabilitiesKHR {
	sType StructureType
	pNext *[]
	sharedPresentSupportedUsageFlags ImageUsageFlags
	sharedPresentSupportedUsageFlags ImageUsageFlags
}

type ImportFenceFdInfoKHR {
	sType StructureType
	pNext *[]
	fence Fence
	flags FenceImportFlags
	handleType ExternalFenceHandleTypeFlagBits
	fd int
	fd int
}

type FenceGetFdInfoKHR {
	sType StructureType
	pNext *[]
	fence Fence
	handleType ExternalFenceHandleTypeFlagBits
	handleType ExternalFenceHandleTypeFlagBits
}

type PhysicalDevicePerformanceQueryFeaturesKHR {
	sType StructureType
	pNext *[]
	performanceCounterQueryPools Bool32
	performanceCounterMultipleQueryPools Bool32
	performanceCounterMultipleQueryPools Bool32
}

type PhysicalDevicePerformanceQueryPropertiesKHR {
	sType StructureType
	pNext *[]
	allowCommandBufferQueryCopies Bool32
	allowCommandBufferQueryCopies Bool32
}

type PerformanceCounterKHR {
	sType StructureType
	pNext *[]
	unit PerformanceCounterUnitKHR
	scope PerformanceCounterScopeKHR
	storage PerformanceCounterStorageKHR
	uuid ubyte
	uuid ubyte
}

type PerformanceCounterDescriptionKHR {
	sType StructureType
	pNext *[]
	flags PerformanceCounterDescriptionFlagsKHR
	name byte
	category byte
	description byte
	description byte
}

type QueryPoolPerformanceCreateInfoKHR {
	sType StructureType
	pNext *[]
	queueFamilyIndex uint
	counterIndexCount uint
	pCounterIndices *uint
	pCounterIndices *uint
}

type AcquireProfilingLockInfoKHR {
	sType StructureType
	pNext *[]
	flags AcquireProfilingLockFlagsKHR
	timeout ulong
	timeout ulong
}

type PerformanceQuerySubmitInfoKHR {
	sType StructureType
	pNext *[]
	counterPassIndex uint
	counterPassIndex uint
}

type PhysicalDeviceSurfaceInfo2KHR {
	sType StructureType
	pNext *[]
	surface SurfaceKHR
	surface SurfaceKHR
}

type SurfaceCapabilities2KHR {
	sType StructureType
	pNext *[]
	surfaceCapabilities SurfaceCapabilitiesKHR
	surfaceCapabilities SurfaceCapabilitiesKHR
}

type SurfaceFormat2KHR {
	sType StructureType
	pNext *[]
	surfaceFormat SurfaceFormatKHR
	surfaceFormat SurfaceFormatKHR
}

type DisplayProperties2KHR {
	sType StructureType
	pNext *[]
	displayProperties DisplayPropertiesKHR
	displayProperties DisplayPropertiesKHR
}

type DisplayPlaneProperties2KHR {
	sType StructureType
	pNext *[]
	displayPlaneProperties DisplayPlanePropertiesKHR
	displayPlaneProperties DisplayPlanePropertiesKHR
}

type DisplayModeProperties2KHR {
	sType StructureType
	pNext *[]
	displayModeProperties DisplayModePropertiesKHR
	displayModeProperties DisplayModePropertiesKHR
}

type DisplayPlaneInfo2KHR {
	sType StructureType
	pNext *[]
	mode DisplayModeKHR
	planeIndex uint
	planeIndex uint
}

type DisplayPlaneCapabilities2KHR {
	sType StructureType
	pNext *[]
	capabilities DisplayPlaneCapabilitiesKHR
	capabilities DisplayPlaneCapabilitiesKHR
}

type PhysicalDeviceShaderClockFeaturesKHR {
	sType StructureType
	pNext *[]
	shaderSubgroupClock Bool32
	shaderDeviceClock Bool32
	shaderDeviceClock Bool32
}

type PhysicalDeviceShaderTerminateInvocationFeaturesKHR {
	sType StructureType
	pNext *[]
	shaderTerminateInvocation Bool32
	shaderTerminateInvocation Bool32
}

type FragmentShadingRateAttachmentInfoKHR {
	sType StructureType
	pNext *[]
	pFragmentShadingRateAttachment *AttachmentReference2
	shadingRateAttachmentTexelSize Extent2D
	shadingRateAttachmentTexelSize Extent2D
}

type PipelineFragmentShadingRateStateCreateInfoKHR {
	sType StructureType
	pNext *[]
	fragmentSize Extent2D
	combinerOps FragmentShadingRateCombinerOpKHR
	combinerOps FragmentShadingRateCombinerOpKHR
}

type PhysicalDeviceFragmentShadingRateFeaturesKHR {
	sType StructureType
	pNext *[]
	pipelineFragmentShadingRate Bool32
	primitiveFragmentShadingRate Bool32
	attachmentFragmentShadingRate Bool32
	attachmentFragmentShadingRate Bool32
}

type PhysicalDeviceFragmentShadingRatePropertiesKHR {
	sType StructureType
	pNext *[]
	minFragmentShadingRateAttachmentTexelSize Extent2D
	maxFragmentShadingRateAttachmentTexelSize Extent2D
	maxFragmentShadingRateAttachmentTexelSizeAspectRatio uint
	primitiveFragmentShadingRateWithMultipleViewports Bool32
	layeredShadingRateAttachments Bool32
	fragmentShadingRateNonTrivialCombinerOps Bool32
	maxFragmentSize Extent2D
	maxFragmentSizeAspectRatio uint
	maxFragmentShadingRateCoverageSamples uint
	maxFragmentShadingRateRasterizationSamples SampleCountFlagBits
	fragmentShadingRateWithShaderDepthStencilWrites Bool32
	fragmentShadingRateWithSampleMask Bool32
	fragmentShadingRateWithShaderSampleMask Bool32
	fragmentShadingRateWithConservativeRasterization Bool32
	fragmentShadingRateWithFragmentShaderInterlock Bool32
	fragmentShadingRateWithCustomSampleLocations Bool32
	fragmentShadingRateStrictMultiplyCombiner Bool32
	fragmentShadingRateStrictMultiplyCombiner Bool32
}

type PhysicalDeviceFragmentShadingRateKHR {
	sType StructureType
	pNext *[]
	sampleCounts SampleCountFlags
	fragmentSize Extent2D
	fragmentSize Extent2D
}

type SurfaceProtectedCapabilitiesKHR {
	sType StructureType
	pNext *[]
	supportsProtected Bool32
	supportsProtected Bool32
}

type PhysicalDevicePipelineExecutablePropertiesFeaturesKHR {
	sType StructureType
	pNext *[]
	pipelineExecutableInfo Bool32
	pipelineExecutableInfo Bool32
}

type PipelineInfoKHR {
	sType StructureType
	pNext *[]
	pipeline Pipeline
	pipeline Pipeline
}

type PipelineExecutablePropertiesKHR {
	sType StructureType
	pNext *[]
	stages ShaderStageFlags
	name byte
	description byte
	subgroupSize uint
	subgroupSize uint
}

type PipelineExecutableInfoKHR {
	sType StructureType
	pNext *[]
	pipeline Pipeline
	executableIndex uint
	executableIndex uint
}

type PipelineExecutableStatisticKHR {
	sType StructureType
	pNext *[]
	name byte
	description byte
	format PipelineExecutableStatisticFormatKHR
	value PipelineExecutableStatisticValueKHR
	value PipelineExecutableStatisticValueKHR
}

type PipelineExecutableInternalRepresentationKHR {
	sType StructureType
	pNext *[]
	name byte
	description byte
	isText Bool32
	dataSize word
	pData *[]
	pData *[]
}

type PipelineLibraryCreateInfoKHR {
	sType StructureType
	pNext *[]
	libraryCount uint
	pLibraries *Pipeline
	pLibraries *Pipeline
}

type BufferCopy2KHR {
	sType StructureType
	pNext *[]
	srcOffset DeviceSize
	dstOffset DeviceSize
	size DeviceSize
	size DeviceSize
}

type CopyBufferInfo2KHR {
	sType StructureType
	pNext *[]
	srcBuffer Buffer
	dstBuffer Buffer
	regionCount uint
	pRegions *BufferCopy2KHR
	pRegions *BufferCopy2KHR
}

type ImageCopy2KHR {
	sType StructureType
	pNext *[]
	srcSubresource ImageSubresourceLayers
	srcOffset Offset3D
	dstSubresource ImageSubresourceLayers
	dstOffset Offset3D
	extent Extent3D
	extent Extent3D
}

type CopyImageInfo2KHR {
	sType StructureType
	pNext *[]
	srcImage Image
	srcImageLayout ImageLayout
	dstImage Image
	dstImageLayout ImageLayout
	regionCount uint
	pRegions *ImageCopy2KHR
	pRegions *ImageCopy2KHR
}

type BufferImageCopy2KHR {
	sType StructureType
	pNext *[]
	bufferOffset DeviceSize
	bufferRowLength uint
	bufferImageHeight uint
	imageSubresource ImageSubresourceLayers
	imageOffset Offset3D
	imageExtent Extent3D
	imageExtent Extent3D
}

type CopyBufferToImageInfo2KHR {
	sType StructureType
	pNext *[]
	srcBuffer Buffer
	dstImage Image
	dstImageLayout ImageLayout
	regionCount uint
	pRegions *BufferImageCopy2KHR
	pRegions *BufferImageCopy2KHR
}

type CopyImageToBufferInfo2KHR {
	sType StructureType
	pNext *[]
	srcImage Image
	srcImageLayout ImageLayout
	dstBuffer Buffer
	regionCount uint
	pRegions *BufferImageCopy2KHR
	pRegions *BufferImageCopy2KHR
}

type ImageBlit2KHR {
	sType StructureType
	pNext *[]
	srcSubresource ImageSubresourceLayers
	srcOffsets Offset3D
	dstSubresource ImageSubresourceLayers
	dstOffsets Offset3D
	dstOffsets Offset3D
}

type BlitImageInfo2KHR {
	sType StructureType
	pNext *[]
	srcImage Image
	srcImageLayout ImageLayout
	dstImage Image
	dstImageLayout ImageLayout
	regionCount uint
	pRegions *ImageBlit2KHR
	filter Filter
	filter Filter
}

type ImageResolve2KHR {
	sType StructureType
	pNext *[]
	srcSubresource ImageSubresourceLayers
	srcOffset Offset3D
	dstSubresource ImageSubresourceLayers
	dstOffset Offset3D
	extent Extent3D
	extent Extent3D
}

type ResolveImageInfo2KHR {
	sType StructureType
	pNext *[]
	srcImage Image
	srcImageLayout ImageLayout
	dstImage Image
	dstImageLayout ImageLayout
	regionCount uint
	pRegions *ImageResolve2KHR
	pRegions *ImageResolve2KHR
}

type DebugReportCallbackCreateInfoEXT {
	sType StructureType
	pNext *[]
	flags DebugReportFlagsEXT
	pfnCallback PFNDebugReportCallbackEXT
	pUserData *[]
	pUserData *[]
}

type PipelineRasterizationStateRasterizationOrderAMD {
	sType StructureType
	pNext *[]
	rasterizationOrder RasterizationOrderAMD
	rasterizationOrder RasterizationOrderAMD
}

type DebugMarkerObjectNameInfoEXT {
	sType StructureType
	pNext *[]
	objectType DebugReportObjectTypeEXT
	object ulong
	pObjectName *byte
	pObjectName *byte
}

type DebugMarkerObjectTagInfoEXT {
	sType StructureType
	pNext *[]
	objectType DebugReportObjectTypeEXT
	object ulong
	tagName ulong
	tagSize word
	pTag *[]
	pTag *[]
}

type DebugMarkerMarkerInfoEXT {
	sType StructureType
	pNext *[]
	pMarkerName *byte
	color real
	color real
}

type DedicatedAllocationImageCreateInfoNV {
	sType StructureType
	pNext *[]
	dedicatedAllocation Bool32
	dedicatedAllocation Bool32
}

type DedicatedAllocationBufferCreateInfoNV {
	sType StructureType
	pNext *[]
	dedicatedAllocation Bool32
	dedicatedAllocation Bool32
}

type DedicatedAllocationMemoryAllocateInfoNV {
	sType StructureType
	pNext *[]
	image Image
	buffer Buffer
	buffer Buffer
}

type PhysicalDeviceTransformFeedbackFeaturesEXT {
	sType StructureType
	pNext *[]
	transformFeedback Bool32
	geometryStreams Bool32
	geometryStreams Bool32
}

type PhysicalDeviceTransformFeedbackPropertiesEXT {
	sType StructureType
	pNext *[]
	maxTransformFeedbackStreams uint
	maxTransformFeedbackBuffers uint
	maxTransformFeedbackBufferSize DeviceSize
	maxTransformFeedbackStreamDataSize uint
	maxTransformFeedbackBufferDataSize uint
	maxTransformFeedbackBufferDataStride uint
	transformFeedbackQueries Bool32
	transformFeedbackStreamsLinesTriangles Bool32
	transformFeedbackRasterizationStreamSelect Bool32
	transformFeedbackDraw Bool32
	transformFeedbackDraw Bool32
}

type PipelineRasterizationStateStreamCreateInfoEXT {
	sType StructureType
	pNext *[]
	flags PipelineRasterizationStateStreamCreateFlagsEXT
	rasterizationStream uint
	rasterizationStream uint
}

type ImageViewHandleInfoNVX {
	sType StructureType
	pNext *[]
	imageView ImageView
	descriptorType DescriptorType
	sampler Sampler
	sampler Sampler
}

type ImageViewAddressPropertiesNVX {
	sType StructureType
	pNext *[]
	deviceAddress DeviceAddress
	size DeviceSize
	size DeviceSize
}

type TextureLODGatherFormatPropertiesAMD {
	sType StructureType
	pNext *[]
	supportsTextureGatherLODBiasAMD Bool32
	supportsTextureGatherLODBiasAMD Bool32
}

type ShaderResourceUsageAMD {
	numUsedVgprs uint
	numUsedSgprs uint
	ldsSizePerLocalWorkGroup uint
	ldsUsageSizeInBytes word
	scratchMemUsageInBytes word
	scratchMemUsageInBytes word
}

type ShaderStatisticsInfoAMD {
	shaderStageMask ShaderStageFlags
	resourceUsage ShaderResourceUsageAMD
	numPhysicalVgprs uint
	numPhysicalSgprs uint
	numAvailableVgprs uint
	numAvailableSgprs uint
	computeWorkGroupSize uint
	computeWorkGroupSize uint
}

type PhysicalDeviceCornerSampledImageFeaturesNV {
	sType StructureType
	pNext *[]
	cornerSampledImage Bool32
	cornerSampledImage Bool32
}

type ExternalImageFormatPropertiesNV {
	imageFormatProperties ImageFormatProperties
	externalMemoryFeatures ExternalMemoryFeatureFlagsNV
	exportFromImportedHandleTypes ExternalMemoryHandleTypeFlagsNV
	compatibleHandleTypes ExternalMemoryHandleTypeFlagsNV
	compatibleHandleTypes ExternalMemoryHandleTypeFlagsNV
}

type ExternalMemoryImageCreateInfoNV {
	sType StructureType
	pNext *[]
	handleTypes ExternalMemoryHandleTypeFlagsNV
	handleTypes ExternalMemoryHandleTypeFlagsNV
}

type ExportMemoryAllocateInfoNV {
	sType StructureType
	pNext *[]
	handleTypes ExternalMemoryHandleTypeFlagsNV
	handleTypes ExternalMemoryHandleTypeFlagsNV
}

type ValidationFlagsEXT {
	sType StructureType
	pNext *[]
	disabledValidationCheckCount uint
	pDisabledValidationChecks *ValidationCheckEXT
	pDisabledValidationChecks *ValidationCheckEXT
}

type PhysicalDeviceTextureCompressionASTCHDRFeaturesEXT {
	sType StructureType
	pNext *[]
	textureCompressionASTC_HDR Bool32
	textureCompressionASTC_HDR Bool32
}

type ImageViewASTCDecodeModeEXT {
	sType StructureType
	pNext *[]
	decodeMode Format
	decodeMode Format
}

type PhysicalDeviceASTCDecodeFeaturesEXT {
	sType StructureType
	pNext *[]
	decodeModeSharedExponent Bool32
	decodeModeSharedExponent Bool32
}

type ConditionalRenderingBeginInfoEXT {
	sType StructureType
	pNext *[]
	buffer Buffer
	offset DeviceSize
	flags ConditionalRenderingFlagsEXT
	flags ConditionalRenderingFlagsEXT
}

type PhysicalDeviceConditionalRenderingFeaturesEXT {
	sType StructureType
	pNext *[]
	conditionalRendering Bool32
	inheritedConditionalRendering Bool32
	inheritedConditionalRendering Bool32
}

type CommandBufferInheritanceConditionalRenderingInfoEXT {
	sType StructureType
	pNext *[]
	conditionalRenderingEnable Bool32
	conditionalRenderingEnable Bool32
}

type ViewportWScalingNV {
	xcoeff real
	ycoeff real
	ycoeff real
}

type PipelineViewportWScalingStateCreateInfoNV {
	sType StructureType
	pNext *[]
	viewportWScalingEnable Bool32
	viewportCount uint
	pViewportWScalings *ViewportWScalingNV
	pViewportWScalings *ViewportWScalingNV
}

type SurfaceCapabilities2EXT {
	sType StructureType
	pNext *[]
	minImageCount uint
	maxImageCount uint
	currentExtent Extent2D
	minImageExtent Extent2D
	maxImageExtent Extent2D
	maxImageArrayLayers uint
	supportedTransforms SurfaceTransformFlagsKHR
	currentTransform SurfaceTransformFlagBitsKHR
	supportedCompositeAlpha CompositeAlphaFlagsKHR
	supportedUsageFlags ImageUsageFlags
	supportedSurfaceCounters SurfaceCounterFlagsEXT
	supportedSurfaceCounters SurfaceCounterFlagsEXT
}

type DisplayPowerInfoEXT {
	sType StructureType
	pNext *[]
	powerState DisplayPowerStateEXT
	powerState DisplayPowerStateEXT
}

type DeviceEventInfoEXT {
	sType StructureType
	pNext *[]
	deviceEvent DeviceEventTypeEXT
	deviceEvent DeviceEventTypeEXT
}

type DisplayEventInfoEXT {
	sType StructureType
	pNext *[]
	displayEvent DisplayEventTypeEXT
	displayEvent DisplayEventTypeEXT
}

type SwapchainCounterCreateInfoEXT {
	sType StructureType
	pNext *[]
	surfaceCounters SurfaceCounterFlagsEXT
	surfaceCounters SurfaceCounterFlagsEXT
}

type RefreshCycleDurationGOOGLE {
	refreshDuration ulong
	refreshDuration ulong
}

type PastPresentationTimingGOOGLE {
	presentID uint
	desiredPresentTime ulong
	actualPresentTime ulong
	earliestPresentTime ulong
	presentMargin ulong
	presentMargin ulong
}

type PresentTimeGOOGLE {
	presentID uint
	desiredPresentTime ulong
	desiredPresentTime ulong
}

type PresentTimesInfoGOOGLE {
	sType StructureType
	pNext *[]
	swapchainCount uint
	pTimes *PresentTimeGOOGLE
	pTimes *PresentTimeGOOGLE
}

type PhysicalDeviceMultiviewPerViewAttributesPropertiesNVX {
	sType StructureType
	pNext *[]
	perViewPositionAllComponents Bool32
	perViewPositionAllComponents Bool32
}

type ViewportSwizzleNV {
	x ViewportCoordinateSwizzleNV
	y ViewportCoordinateSwizzleNV
	z ViewportCoordinateSwizzleNV
	w ViewportCoordinateSwizzleNV
	w ViewportCoordinateSwizzleNV
}

type PipelineViewportSwizzleStateCreateInfoNV {
	sType StructureType
	pNext *[]
	flags PipelineViewportSwizzleStateCreateFlagsNV
	viewportCount uint
	pViewportSwizzles *ViewportSwizzleNV
	pViewportSwizzles *ViewportSwizzleNV
}

type PhysicalDeviceDiscardRectanglePropertiesEXT {
	sType StructureType
	pNext *[]
	maxDiscardRectangles uint
	maxDiscardRectangles uint
}

type PipelineDiscardRectangleStateCreateInfoEXT {
	sType StructureType
	pNext *[]
	flags PipelineDiscardRectangleStateCreateFlagsEXT
	discardRectangleMode DiscardRectangleModeEXT
	discardRectangleCount uint
	pDiscardRectangles *Rect2D
	pDiscardRectangles *Rect2D
}

type PhysicalDeviceConservativeRasterizationPropertiesEXT {
	sType StructureType
	pNext *[]
	primitiveOverestimationSize real
	maxExtraPrimitiveOverestimationSize real
	extraPrimitiveOverestimationSizeGranularity real
	primitiveUnderestimation Bool32
	conservativePointAndLineRasterization Bool32
	degenerateTrianglesRasterized Bool32
	degenerateLinesRasterized Bool32
	fullyCoveredFragmentShaderInputVariable Bool32
	conservativeRasterizationPostDepthCoverage Bool32
	conservativeRasterizationPostDepthCoverage Bool32
}

type PipelineRasterizationConservativeStateCreateInfoEXT {
	sType StructureType
	pNext *[]
	flags PipelineRasterizationConservativeStateCreateFlagsEXT
	conservativeRasterizationMode ConservativeRasterizationModeEXT
	extraPrimitiveOverestimationSize real
	extraPrimitiveOverestimationSize real
}

type PhysicalDeviceDepthClipEnableFeaturesEXT {
	sType StructureType
	pNext *[]
	depthClipEnable Bool32
	depthClipEnable Bool32
}

type PipelineRasterizationDepthClipStateCreateInfoEXT {
	sType StructureType
	pNext *[]
	flags PipelineRasterizationDepthClipStateCreateFlagsEXT
	depthClipEnable Bool32
	depthClipEnable Bool32
}

type XYColorEXT {
	x real
	y real
	y real
}

type HdrMetadataEXT {
	sType StructureType
	pNext *[]
	displayPrimaryRed XYColorEXT
	displayPrimaryGreen XYColorEXT
	displayPrimaryBlue XYColorEXT
	whitePoint XYColorEXT
	maxLuminance real
	minLuminance real
	maxContentLightLevel real
	maxFrameAverageLightLevel real
	maxFrameAverageLightLevel real
}

type DebugUtilsLabelEXT {
	sType StructureType
	pNext *[]
	pLabelName *byte
	color real
	color real
}

type DebugUtilsObjectNameInfoEXT {
	sType StructureType
	pNext *[]
	objectType ObjectType
	objectHandle ulong
	pObjectName *byte
	pObjectName *byte
}

type DebugUtilsMessengerCallbackDataEXT {
	sType StructureType
	pNext *[]
	flags DebugUtilsMessengerCallbackDataFlagsEXT
	pMessageIdName *byte
	messageIdNumber int
	pMessage *byte
	queueLabelCount uint
	pQueueLabels *DebugUtilsLabelEXT
	cmdBufLabelCount uint
	pCmdBufLabels *DebugUtilsLabelEXT
	objectCount uint
	pObjects *DebugUtilsObjectNameInfoEXT
	pObjects *DebugUtilsObjectNameInfoEXT
}

type DebugUtilsMessengerCreateInfoEXT {
	sType StructureType
	pNext *[]
	flags DebugUtilsMessengerCreateFlagsEXT
	messageSeverity DebugUtilsMessageSeverityFlagsEXT
	messageType DebugUtilsMessageTypeFlagsEXT
	pfnUserCallback PFNDebugUtilsMessengerCallbackEXT
	pUserData *[]
	pUserData *[]
}

type DebugUtilsObjectTagInfoEXT {
	sType StructureType
	pNext *[]
	objectType ObjectType
	objectHandle ulong
	tagName ulong
	tagSize word
	pTag *[]
	pTag *[]
}

type PhysicalDeviceInlineUniformBlockFeaturesEXT {
	sType StructureType
	pNext *[]
	inlineUniformBlock Bool32
	descriptorBindingInlineUniformBlockUpdateAfterBind Bool32
	descriptorBindingInlineUniformBlockUpdateAfterBind Bool32
}

type PhysicalDeviceInlineUniformBlockPropertiesEXT {
	sType StructureType
	pNext *[]
	maxInlineUniformBlockSize uint
	maxPerStageDescriptorInlineUniformBlocks uint
	maxPerStageDescriptorUpdateAfterBindInlineUniformBlocks uint
	maxDescriptorSetInlineUniformBlocks uint
	maxDescriptorSetUpdateAfterBindInlineUniformBlocks uint
	maxDescriptorSetUpdateAfterBindInlineUniformBlocks uint
}

type WriteDescriptorSetInlineUniformBlockEXT {
	sType StructureType
	pNext *[]
	dataSize uint
	pData *[]
	pData *[]
}

type DescriptorPoolInlineUniformBlockCreateInfoEXT {
	sType StructureType
	pNext *[]
	maxInlineUniformBlockBindings uint
	maxInlineUniformBlockBindings uint
}

type SampleLocationEXT {
	x real
	y real
	y real
}

type SampleLocationsInfoEXT {
	sType StructureType
	pNext *[]
	sampleLocationsPerPixel SampleCountFlagBits
	sampleLocationGridSize Extent2D
	sampleLocationsCount uint
	pSampleLocations *SampleLocationEXT
	pSampleLocations *SampleLocationEXT
}

type AttachmentSampleLocationsEXT {
	attachmentIndex uint
	sampleLocationsInfo SampleLocationsInfoEXT
	sampleLocationsInfo SampleLocationsInfoEXT
}

type SubpassSampleLocationsEXT {
	subpassIndex uint
	sampleLocationsInfo SampleLocationsInfoEXT
	sampleLocationsInfo SampleLocationsInfoEXT
}

type RenderPassSampleLocationsBeginInfoEXT {
	sType StructureType
	pNext *[]
	attachmentInitialSampleLocationsCount uint
	pAttachmentInitialSampleLocations *AttachmentSampleLocationsEXT
	postSubpassSampleLocationsCount uint
	pPostSubpassSampleLocations *SubpassSampleLocationsEXT
	pPostSubpassSampleLocations *SubpassSampleLocationsEXT
}

type PipelineSampleLocationsStateCreateInfoEXT {
	sType StructureType
	pNext *[]
	sampleLocationsEnable Bool32
	sampleLocationsInfo SampleLocationsInfoEXT
	sampleLocationsInfo SampleLocationsInfoEXT
}

type PhysicalDeviceSampleLocationsPropertiesEXT {
	sType StructureType
	pNext *[]
	sampleLocationSampleCounts SampleCountFlags
	maxSampleLocationGridSize Extent2D
	sampleLocationCoordinateRange real
	sampleLocationSubPixelBits uint
	variableSampleLocations Bool32
	variableSampleLocations Bool32
}

type MultisamplePropertiesEXT {
	sType StructureType
	pNext *[]
	maxSampleLocationGridSize Extent2D
	maxSampleLocationGridSize Extent2D
}

type PhysicalDeviceBlendOperationAdvancedFeaturesEXT {
	sType StructureType
	pNext *[]
	advancedBlendCoherentOperations Bool32
	advancedBlendCoherentOperations Bool32
}

type PhysicalDeviceBlendOperationAdvancedPropertiesEXT {
	sType StructureType
	pNext *[]
	advancedBlendMaxColorAttachments uint
	advancedBlendIndependentBlend Bool32
	advancedBlendNonPremultipliedSrcColor Bool32
	advancedBlendNonPremultipliedDstColor Bool32
	advancedBlendCorrelatedOverlap Bool32
	advancedBlendAllOperations Bool32
	advancedBlendAllOperations Bool32
}

type PipelineColorBlendAdvancedStateCreateInfoEXT {
	sType StructureType
	pNext *[]
	srcPremultiplied Bool32
	dstPremultiplied Bool32
	blendOverlap BlendOverlapEXT
	blendOverlap BlendOverlapEXT
}

type PipelineCoverageToColorStateCreateInfoNV {
	sType StructureType
	pNext *[]
	flags PipelineCoverageToColorStateCreateFlagsNV
	coverageToColorEnable Bool32
	coverageToColorLocation uint
	coverageToColorLocation uint
}

type PipelineCoverageModulationStateCreateInfoNV {
	sType StructureType
	pNext *[]
	flags PipelineCoverageModulationStateCreateFlagsNV
	coverageModulationMode CoverageModulationModeNV
	coverageModulationTableEnable Bool32
	coverageModulationTableCount uint
	pCoverageModulationTable *real
	pCoverageModulationTable *real
}

type PhysicalDeviceShaderSMBuiltinsPropertiesNV {
	sType StructureType
	pNext *[]
	shaderSMCount uint
	shaderWarpsPerSM uint
	shaderWarpsPerSM uint
}

type PhysicalDeviceShaderSMBuiltinsFeaturesNV {
	sType StructureType
	pNext *[]
	shaderSMBuiltins Bool32
	shaderSMBuiltins Bool32
}

type DrmFormatModifierPropertiesEXT {
	drmFormatModifier ulong
	drmFormatModifierPlaneCount uint
	drmFormatModifierTilingFeatures FormatFeatureFlags
	drmFormatModifierTilingFeatures FormatFeatureFlags
}

type DrmFormatModifierPropertiesListEXT {
	sType StructureType
	pNext *[]
	drmFormatModifierCount uint
	pDrmFormatModifierProperties *DrmFormatModifierPropertiesEXT
	pDrmFormatModifierProperties *DrmFormatModifierPropertiesEXT
}

type PhysicalDeviceImageDrmFormatModifierInfoEXT {
	sType StructureType
	pNext *[]
	drmFormatModifier ulong
	sharingMode SharingMode
	queueFamilyIndexCount uint
	pQueueFamilyIndices *uint
	pQueueFamilyIndices *uint
}

type ImageDrmFormatModifierListCreateInfoEXT {
	sType StructureType
	pNext *[]
	drmFormatModifierCount uint
	pDrmFormatModifiers *ulong
	pDrmFormatModifiers *ulong
}

type ImageDrmFormatModifierExplicitCreateInfoEXT {
	sType StructureType
	pNext *[]
	drmFormatModifier ulong
	drmFormatModifierPlaneCount uint
	pPlaneLayouts *SubresourceLayout
	pPlaneLayouts *SubresourceLayout
}

type ImageDrmFormatModifierPropertiesEXT {
	sType StructureType
	pNext *[]
	drmFormatModifier ulong
	drmFormatModifier ulong
}

type ValidationCacheCreateInfoEXT {
	sType StructureType
	pNext *[]
	flags ValidationCacheCreateFlagsEXT
	initialDataSize word
	pInitialData *[]
	pInitialData *[]
}

type ShaderModuleValidationCacheCreateInfoEXT {
	sType StructureType
	pNext *[]
	validationCache ValidationCacheEXT
	validationCache ValidationCacheEXT
}

type ShadingRatePaletteNV {
	shadingRatePaletteEntryCount uint
	pShadingRatePaletteEntries *ShadingRatePaletteEntryNV
	pShadingRatePaletteEntries *ShadingRatePaletteEntryNV
}

type PipelineViewportShadingRateImageStateCreateInfoNV {
	sType StructureType
	pNext *[]
	shadingRateImageEnable Bool32
	viewportCount uint
	pShadingRatePalettes *ShadingRatePaletteNV
	pShadingRatePalettes *ShadingRatePaletteNV
}

type PhysicalDeviceShadingRateImageFeaturesNV {
	sType StructureType
	pNext *[]
	shadingRateImage Bool32
	shadingRateCoarseSampleOrder Bool32
	shadingRateCoarseSampleOrder Bool32
}

type PhysicalDeviceShadingRateImagePropertiesNV {
	sType StructureType
	pNext *[]
	shadingRateTexelSize Extent2D
	shadingRatePaletteSize uint
	shadingRateMaxCoarseSamples uint
	shadingRateMaxCoarseSamples uint
}

type CoarseSampleLocationNV {
	pixelX uint
	pixelY uint
	sample uint
	sample uint
}

type CoarseSampleOrderCustomNV {
	shadingRate ShadingRatePaletteEntryNV
	sampleCount uint
	sampleLocationCount uint
	pSampleLocations *CoarseSampleLocationNV
	pSampleLocations *CoarseSampleLocationNV
}

type PipelineViewportCoarseSampleOrderStateCreateInfoNV {
	sType StructureType
	pNext *[]
	sampleOrderType CoarseSampleOrderTypeNV
	customSampleOrderCount uint
	pCustomSampleOrders *CoarseSampleOrderCustomNV
	pCustomSampleOrders *CoarseSampleOrderCustomNV
}

type RayTracingShaderGroupCreateInfoNV {
	sType StructureType
	pNext *[]
	ty RayTracingShaderGroupTypeKHR
	generalShader uint
	closestHitShader uint
	anyHitShader uint
	intersectionShader uint
	intersectionShader uint
}

type RayTracingPipelineCreateInfoNV {
	sType StructureType
	pNext *[]
	flags PipelineCreateFlags
	stageCount uint
	pStages *PipelineShaderStageCreateInfo
	groupCount uint
	pGroups *RayTracingShaderGroupCreateInfoNV
	maxRecursionDepth uint
	layout PipelineLayout
	basePipelineHandle Pipeline
	basePipelineIndex int
	basePipelineIndex int
}

type GeometryTrianglesNV {
	sType StructureType
	pNext *[]
	vertexData Buffer
	vertexOffset DeviceSize
	vertexCount uint
	vertexStride DeviceSize
	vertexFormat Format
	indexData Buffer
	indexOffset DeviceSize
	indexCount uint
	indexType IndexType
	transformData Buffer
	transformOffset DeviceSize
	transformOffset DeviceSize
}

type GeometryAABBNV {
	sType StructureType
	pNext *[]
	aabbData Buffer
	numAABBs uint
	stride uint
	offset DeviceSize
	offset DeviceSize
}

type GeometryDataNV {
	triangles GeometryTrianglesNV
	aabbs GeometryAABBNV
	aabbs GeometryAABBNV
}

type GeometryNV {
	sType StructureType
	pNext *[]
	geometryType GeometryTypeKHR
	geometry GeometryDataNV
	flags GeometryFlagsKHR
	flags GeometryFlagsKHR
}

type AccelerationStructureInfoNV {
	sType StructureType
	pNext *[]
	ty AccelerationStructureTypeNV
	flags BuildAccelerationStructureFlagsNV
	instanceCount uint
	geometryCount uint
	pGeometries *GeometryNV
	pGeometries *GeometryNV
}

type AccelerationStructureCreateInfoNV {
	sType StructureType
	pNext *[]
	compactedSize DeviceSize
	info AccelerationStructureInfoNV
	info AccelerationStructureInfoNV
}

type BindAccelerationStructureMemoryInfoNV {
	sType StructureType
	pNext *[]
	accelerationStructure AccelerationStructureNV
	memory DeviceMemory
	memoryOffset DeviceSize
	deviceIndexCount uint
	pDeviceIndices *uint
	pDeviceIndices *uint
}

type WriteDescriptorSetAccelerationStructureNV {
	sType StructureType
	pNext *[]
	accelerationStructureCount uint
	pAccelerationStructures *AccelerationStructureNV
	pAccelerationStructures *AccelerationStructureNV
}

type AccelerationStructureMemoryRequirementsInfoNV {
	sType StructureType
	pNext *[]
	ty AccelerationStructureMemoryRequirementsTypeNV
	accelerationStructure AccelerationStructureNV
	accelerationStructure AccelerationStructureNV
}

type PhysicalDeviceRayTracingPropertiesNV {
	sType StructureType
	pNext *[]
	shaderGroupHandleSize uint
	maxRecursionDepth uint
	maxShaderGroupStride uint
	shaderGroupBaseAlignment uint
	maxGeometryCount ulong
	maxInstanceCount ulong
	maxTriangleCount ulong
	maxDescriptorSetAccelerationStructures uint
	maxDescriptorSetAccelerationStructures uint
}

type TransformMatrixKHR {
	matrix real
	matrix real
}

type AabbPositionsKHR {
	minX real
	minY real
	minZ real
	maxX real
	maxY real
	maxZ real
	maxZ real
}

type AccelerationStructureInstanceKHR {
	transform TransformMatrixKHR
	instanceCustomIndex uint
	mask uint
	instanceShaderBindingTableRecordOffset uint
	flags GeometryInstanceFlagsKHR
	accelerationStructureReference ulong
	accelerationStructureReference ulong
}

type PhysicalDeviceRepresentativeFragmentTestFeaturesNV {
	sType StructureType
	pNext *[]
	representativeFragmentTest Bool32
	representativeFragmentTest Bool32
}

type PipelineRepresentativeFragmentTestStateCreateInfoNV {
	sType StructureType
	pNext *[]
	representativeFragmentTestEnable Bool32
	representativeFragmentTestEnable Bool32
}

type PhysicalDeviceImageViewImageFormatInfoEXT {
	sType StructureType
	pNext *[]
	imageViewType ImageViewType
	imageViewType ImageViewType
}

type FilterCubicImageViewImageFormatPropertiesEXT {
	sType StructureType
	pNext *[]
	filterCubic Bool32
	filterCubicMinmax Bool32
	filterCubicMinmax Bool32
}

type DeviceQueueGlobalPriorityCreateInfoEXT {
	sType StructureType
	pNext *[]
	globalPriority QueueGlobalPriorityEXT
	globalPriority QueueGlobalPriorityEXT
}

type ImportMemoryHostPointerInfoEXT {
	sType StructureType
	pNext *[]
	handleType ExternalMemoryHandleTypeFlagBits
	pHostPointer *[]
	pHostPointer *[]
}

type MemoryHostPointerPropertiesEXT {
	sType StructureType
	pNext *[]
	memoryTypeBits uint
	memoryTypeBits uint
}

type PhysicalDeviceExternalMemoryHostPropertiesEXT {
	sType StructureType
	pNext *[]
	minImportedHostPointerAlignment DeviceSize
	minImportedHostPointerAlignment DeviceSize
}

type PipelineCompilerControlCreateInfoAMD {
	sType StructureType
	pNext *[]
	compilerControlFlags PipelineCompilerControlFlagsAMD
	compilerControlFlags PipelineCompilerControlFlagsAMD
}

type CalibratedTimestampInfoEXT {
	sType StructureType
	pNext *[]
	timeDomain TimeDomainEXT
	timeDomain TimeDomainEXT
}

type PhysicalDeviceShaderCorePropertiesAMD {
	sType StructureType
	pNext *[]
	shaderEngineCount uint
	shaderArraysPerEngineCount uint
	computeUnitsPerShaderArray uint
	simdPerComputeUnit uint
	wavefrontsPerSimd uint
	wavefrontSize uint
	sgprsPerSimd uint
	minSgprAllocation uint
	maxSgprAllocation uint
	sgprAllocationGranularity uint
	vgprsPerSimd uint
	minVgprAllocation uint
	maxVgprAllocation uint
	vgprAllocationGranularity uint
	vgprAllocationGranularity uint
}

type DeviceMemoryOverallocationCreateInfoAMD {
	sType StructureType
	pNext *[]
	overallocationBehavior MemoryOverallocationBehaviorAMD
	overallocationBehavior MemoryOverallocationBehaviorAMD
}

type PhysicalDeviceVertexAttributeDivisorPropertiesEXT {
	sType StructureType
	pNext *[]
	maxVertexAttribDivisor uint
	maxVertexAttribDivisor uint
}

type VertexInputBindingDivisorDescriptionEXT {
	binding uint
	divisor uint
	divisor uint
}

type PipelineVertexInputDivisorStateCreateInfoEXT {
	sType StructureType
	pNext *[]
	vertexBindingDivisorCount uint
	pVertexBindingDivisors *VertexInputBindingDivisorDescriptionEXT
	pVertexBindingDivisors *VertexInputBindingDivisorDescriptionEXT
}

type PhysicalDeviceVertexAttributeDivisorFeaturesEXT {
	sType StructureType
	pNext *[]
	vertexAttributeInstanceRateDivisor Bool32
	vertexAttributeInstanceRateZeroDivisor Bool32
	vertexAttributeInstanceRateZeroDivisor Bool32
}

type PipelineCreationFeedbackEXT {
	flags PipelineCreationFeedbackFlagsEXT
	duration ulong
	duration ulong
}

type PipelineCreationFeedbackCreateInfoEXT {
	sType StructureType
	pNext *[]
	pPipelineCreationFeedback *PipelineCreationFeedbackEXT
	pipelineStageCreationFeedbackCount uint
	pPipelineStageCreationFeedbacks *PipelineCreationFeedbackEXT
	pPipelineStageCreationFeedbacks *PipelineCreationFeedbackEXT
}

type PhysicalDeviceComputeShaderDerivativesFeaturesNV {
	sType StructureType
	pNext *[]
	computeDerivativeGroupQuads Bool32
	computeDerivativeGroupLinear Bool32
	computeDerivativeGroupLinear Bool32
}

type PhysicalDeviceMeshShaderFeaturesNV {
	sType StructureType
	pNext *[]
	taskShader Bool32
	meshShader Bool32
	meshShader Bool32
}

type PhysicalDeviceMeshShaderPropertiesNV {
	sType StructureType
	pNext *[]
	maxDrawMeshTasksCount uint
	maxTaskWorkGroupInvocations uint
	maxTaskWorkGroupSize uint
	maxTaskTotalMemorySize uint
	maxTaskOutputCount uint
	maxMeshWorkGroupInvocations uint
	maxMeshWorkGroupSize uint
	maxMeshTotalMemorySize uint
	maxMeshOutputVertices uint
	maxMeshOutputPrimitives uint
	maxMeshMultiviewViewCount uint
	meshOutputPerVertexGranularity uint
	meshOutputPerPrimitiveGranularity uint
	meshOutputPerPrimitiveGranularity uint
}

type DrawMeshTasksIndirectCommandNV {
	taskCount uint
	firstTask uint
	firstTask uint
}

type PhysicalDeviceFragmentShaderBarycentricFeaturesNV {
	sType StructureType
	pNext *[]
	fragmentShaderBarycentric Bool32
	fragmentShaderBarycentric Bool32
}

type PhysicalDeviceShaderImageFootprintFeaturesNV {
	sType StructureType
	pNext *[]
	imageFootprint Bool32
	imageFootprint Bool32
}

type PipelineViewportExclusiveScissorStateCreateInfoNV {
	sType StructureType
	pNext *[]
	exclusiveScissorCount uint
	pExclusiveScissors *Rect2D
	pExclusiveScissors *Rect2D
}

type PhysicalDeviceExclusiveScissorFeaturesNV {
	sType StructureType
	pNext *[]
	exclusiveScissor Bool32
	exclusiveScissor Bool32
}

type QueueFamilyCheckpointPropertiesNV {
	sType StructureType
	pNext *[]
	checkpointExecutionStageMask PipelineStageFlags
	checkpointExecutionStageMask PipelineStageFlags
}

type CheckpointDataNV {
	sType StructureType
	pNext *[]
	stage PipelineStageFlagBits
	pCheckpointMarker *[]
	pCheckpointMarker *[]
}

type PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL {
	sType StructureType
	pNext *[]
	shaderIntegerFunctions2 Bool32
	shaderIntegerFunctions2 Bool32
}

type PerformanceValueINTEL {
	ty PerformanceValueTypeINTEL
	data PerformanceValueDataINTEL
	data PerformanceValueDataINTEL
}

type InitializePerformanceApiInfoINTEL {
	sType StructureType
	pNext *[]
	pUserData *[]
	pUserData *[]
}

type QueryPoolPerformanceQueryCreateInfoINTEL {
	sType StructureType
	pNext *[]
	performanceCountersSampling QueryPoolSamplingModeINTEL
	performanceCountersSampling QueryPoolSamplingModeINTEL
}

type PerformanceMarkerInfoINTEL {
	sType StructureType
	pNext *[]
	marker ulong
	marker ulong
}

type PerformanceStreamMarkerInfoINTEL {
	sType StructureType
	pNext *[]
	marker uint
	marker uint
}

type PerformanceOverrideInfoINTEL {
	sType StructureType
	pNext *[]
	ty PerformanceOverrideTypeINTEL
	enable Bool32
	parameter ulong
	parameter ulong
}

type PerformanceConfigurationAcquireInfoINTEL {
	sType StructureType
	pNext *[]
	ty PerformanceConfigurationTypeINTEL
	ty PerformanceConfigurationTypeINTEL
}

type PhysicalDevicePCIBusInfoPropertiesEXT {
	sType StructureType
	pNext *[]
	pciDomain uint
	pciBus uint
	pciDevice uint
	pciFunction uint
	pciFunction uint
}

type DisplayNativeHdrSurfaceCapabilitiesAMD {
	sType StructureType
	pNext *[]
	localDimmingSupport Bool32
	localDimmingSupport Bool32
}

type SwapchainDisplayNativeHdrCreateInfoAMD {
	sType StructureType
	pNext *[]
	localDimmingEnable Bool32
	localDimmingEnable Bool32
}

type PhysicalDeviceFragmentDensityMapFeaturesEXT {
	sType StructureType
	pNext *[]
	fragmentDensityMap Bool32
	fragmentDensityMapDynamic Bool32
	fragmentDensityMapNonSubsampledImages Bool32
	fragmentDensityMapNonSubsampledImages Bool32
}

type PhysicalDeviceFragmentDensityMapPropertiesEXT {
	sType StructureType
	pNext *[]
	minFragmentDensityTexelSize Extent2D
	maxFragmentDensityTexelSize Extent2D
	fragmentDensityInvocations Bool32
	fragmentDensityInvocations Bool32
}

type RenderPassFragmentDensityMapCreateInfoEXT {
	sType StructureType
	pNext *[]
	fragmentDensityMapAttachment AttachmentReference
	fragmentDensityMapAttachment AttachmentReference
}

type PhysicalDeviceSubgroupSizeControlFeaturesEXT {
	sType StructureType
	pNext *[]
	subgroupSizeControl Bool32
	computeFullSubgroups Bool32
	computeFullSubgroups Bool32
}

type PhysicalDeviceSubgroupSizeControlPropertiesEXT {
	sType StructureType
	pNext *[]
	minSubgroupSize uint
	maxSubgroupSize uint
	maxComputeWorkgroupSubgroups uint
	requiredSubgroupSizeStages ShaderStageFlags
	requiredSubgroupSizeStages ShaderStageFlags
}

type PipelineShaderStageRequiredSubgroupSizeCreateInfoEXT {
	sType StructureType
	pNext *[]
	requiredSubgroupSize uint
	requiredSubgroupSize uint
}

type PhysicalDeviceShaderCoreProperties2AMD {
	sType StructureType
	pNext *[]
	shaderCoreFeatures ShaderCorePropertiesFlagsAMD
	activeComputeUnitCount uint
	activeComputeUnitCount uint
}

type PhysicalDeviceCoherentMemoryFeaturesAMD {
	sType StructureType
	pNext *[]
	deviceCoherentMemory Bool32
	deviceCoherentMemory Bool32
}

type PhysicalDeviceShaderImageAtomicInt64FeaturesEXT {
	sType StructureType
	pNext *[]
	shaderImageInt64Atomics Bool32
	sparseImageInt64Atomics Bool32
	sparseImageInt64Atomics Bool32
}

type PhysicalDeviceMemoryBudgetPropertiesEXT {
	sType StructureType
	pNext *[]
	heapBudget DeviceSize
	heapUsage DeviceSize
	heapUsage DeviceSize
}

type PhysicalDeviceMemoryPriorityFeaturesEXT {
	sType StructureType
	pNext *[]
	memoryPriority Bool32
	memoryPriority Bool32
}

type MemoryPriorityAllocateInfoEXT {
	sType StructureType
	pNext *[]
	priority real
	priority real
}

type PhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV {
	sType StructureType
	pNext *[]
	dedicatedAllocationImageAliasing Bool32
	dedicatedAllocationImageAliasing Bool32
}

type PhysicalDeviceBufferDeviceAddressFeaturesEXT {
	sType StructureType
	pNext *[]
	bufferDeviceAddress Bool32
	bufferDeviceAddressCaptureReplay Bool32
	bufferDeviceAddressMultiDevice Bool32
	bufferDeviceAddressMultiDevice Bool32
}

type BufferDeviceAddressCreateInfoEXT {
	sType StructureType
	pNext *[]
	deviceAddress DeviceAddress
	deviceAddress DeviceAddress
}

type PhysicalDeviceToolPropertiesEXT {
	sType StructureType
	pNext *[]
	name byte
	version byte
	purposes ToolPurposeFlagsEXT
	description byte
	layer byte
	layer byte
}

type ValidationFeaturesEXT {
	sType StructureType
	pNext *[]
	enabledValidationFeatureCount uint
	pEnabledValidationFeatures *ValidationFeatureEnableEXT
	disabledValidationFeatureCount uint
	pDisabledValidationFeatures *ValidationFeatureDisableEXT
	pDisabledValidationFeatures *ValidationFeatureDisableEXT
}

type CooperativeMatrixPropertiesNV {
	sType StructureType
	pNext *[]
	MSize uint
	NSize uint
	KSize uint
	AType ComponentTypeNV
	BType ComponentTypeNV
	CType ComponentTypeNV
	DType ComponentTypeNV
	scope ScopeNV
	scope ScopeNV
}

type PhysicalDeviceCooperativeMatrixFeaturesNV {
	sType StructureType
	pNext *[]
	cooperativeMatrix Bool32
	cooperativeMatrixRobustBufferAccess Bool32
	cooperativeMatrixRobustBufferAccess Bool32
}

type PhysicalDeviceCooperativeMatrixPropertiesNV {
	sType StructureType
	pNext *[]
	cooperativeMatrixSupportedStages ShaderStageFlags
	cooperativeMatrixSupportedStages ShaderStageFlags
}

type PhysicalDeviceCoverageReductionModeFeaturesNV {
	sType StructureType
	pNext *[]
	coverageReductionMode Bool32
	coverageReductionMode Bool32
}

type PipelineCoverageReductionStateCreateInfoNV {
	sType StructureType
	pNext *[]
	flags PipelineCoverageReductionStateCreateFlagsNV
	coverageReductionMode CoverageReductionModeNV
	coverageReductionMode CoverageReductionModeNV
}

type FramebufferMixedSamplesCombinationNV {
	sType StructureType
	pNext *[]
	coverageReductionMode CoverageReductionModeNV
	rasterizationSamples SampleCountFlagBits
	depthStencilSamples SampleCountFlags
	colorSamples SampleCountFlags
	colorSamples SampleCountFlags
}

type PhysicalDeviceFragmentShaderInterlockFeaturesEXT {
	sType StructureType
	pNext *[]
	fragmentShaderSampleInterlock Bool32
	fragmentShaderPixelInterlock Bool32
	fragmentShaderShadingRateInterlock Bool32
	fragmentShaderShadingRateInterlock Bool32
}

type PhysicalDeviceYcbcrImageArraysFeaturesEXT {
	sType StructureType
	pNext *[]
	ycbcrImageArrays Bool32
	ycbcrImageArrays Bool32
}

type HeadlessSurfaceCreateInfoEXT {
	sType StructureType
	pNext *[]
	flags HeadlessSurfaceCreateFlagsEXT
	flags HeadlessSurfaceCreateFlagsEXT
}

type PhysicalDeviceLineRasterizationFeaturesEXT {
	sType StructureType
	pNext *[]
	rectangularLines Bool32
	bresenhamLines Bool32
	smoothLines Bool32
	stippledRectangularLines Bool32
	stippledBresenhamLines Bool32
	stippledSmoothLines Bool32
	stippledSmoothLines Bool32
}

type PhysicalDeviceLineRasterizationPropertiesEXT {
	sType StructureType
	pNext *[]
	lineSubPixelPrecisionBits uint
	lineSubPixelPrecisionBits uint
}

type PipelineRasterizationLineStateCreateInfoEXT {
	sType StructureType
	pNext *[]
	lineRasterizationMode LineRasterizationModeEXT
	stippledLineEnable Bool32
	lineStippleFactor uint
	lineStipplePattern ushort
	lineStipplePattern ushort
}

type PhysicalDeviceShaderAtomicFloatFeaturesEXT {
	sType StructureType
	pNext *[]
	shaderBufferFloat32Atomics Bool32
	shaderBufferFloat32AtomicAdd Bool32
	shaderBufferFloat64Atomics Bool32
	shaderBufferFloat64AtomicAdd Bool32
	shaderSharedFloat32Atomics Bool32
	shaderSharedFloat32AtomicAdd Bool32
	shaderSharedFloat64Atomics Bool32
	shaderSharedFloat64AtomicAdd Bool32
	shaderImageFloat32Atomics Bool32
	shaderImageFloat32AtomicAdd Bool32
	sparseImageFloat32Atomics Bool32
	sparseImageFloat32AtomicAdd Bool32
	sparseImageFloat32AtomicAdd Bool32
}

type PhysicalDeviceIndexTypeUint8FeaturesEXT {
	sType StructureType
	pNext *[]
	indexTypeUint8 Bool32
	indexTypeUint8 Bool32
}

type PhysicalDeviceExtendedDynamicStateFeaturesEXT {
	sType StructureType
	pNext *[]
	extendedDynamicState Bool32
	extendedDynamicState Bool32
}

type PhysicalDeviceShaderDemoteToHelperInvocationFeaturesEXT {
	sType StructureType
	pNext *[]
	shaderDemoteToHelperInvocation Bool32
	shaderDemoteToHelperInvocation Bool32
}

type PhysicalDeviceDeviceGeneratedCommandsPropertiesNV {
	sType StructureType
	pNext *[]
	maxGraphicsShaderGroupCount uint
	maxIndirectSequenceCount uint
	maxIndirectCommandsTokenCount uint
	maxIndirectCommandsStreamCount uint
	maxIndirectCommandsTokenOffset uint
	maxIndirectCommandsStreamStride uint
	minSequencesCountBufferOffsetAlignment uint
	minSequencesIndexBufferOffsetAlignment uint
	minIndirectCommandsBufferOffsetAlignment uint
	minIndirectCommandsBufferOffsetAlignment uint
}

type PhysicalDeviceDeviceGeneratedCommandsFeaturesNV {
	sType StructureType
	pNext *[]
	deviceGeneratedCommands Bool32
	deviceGeneratedCommands Bool32
}

type GraphicsShaderGroupCreateInfoNV {
	sType StructureType
	pNext *[]
	stageCount uint
	pStages *PipelineShaderStageCreateInfo
	pVertexInputState *PipelineVertexInputStateCreateInfo
	pTessellationState *PipelineTessellationStateCreateInfo
	pTessellationState *PipelineTessellationStateCreateInfo
}

type GraphicsPipelineShaderGroupsCreateInfoNV {
	sType StructureType
	pNext *[]
	groupCount uint
	pGroups *GraphicsShaderGroupCreateInfoNV
	pipelineCount uint
	pPipelines *Pipeline
	pPipelines *Pipeline
}

type BindShaderGroupIndirectCommandNV {
	groupIndex uint
	groupIndex uint
}

type BindIndexBufferIndirectCommandNV {
	bufferAddress DeviceAddress
	size uint
	indexType IndexType
	indexType IndexType
}

type BindVertexBufferIndirectCommandNV {
	bufferAddress DeviceAddress
	size uint
	stride uint
	stride uint
}

type SetStateFlagsIndirectCommandNV {
	data uint
	data uint
}

type IndirectCommandsStreamNV {
	buffer Buffer
	offset DeviceSize
	offset DeviceSize
}

type IndirectCommandsLayoutTokenNV {
	sType StructureType
	pNext *[]
	tokenType IndirectCommandsTokenTypeNV
	stream uint
	offset uint
	vertexBindingUnit uint
	vertexDynamicStride Bool32
	pushconstantPipelineLayout PipelineLayout
	pushconstantShaderStageFlags ShaderStageFlags
	pushconstantOffset uint
	pushconstantSize uint
	indirectStateFlags IndirectStateFlagsNV
	indexTypeCount uint
	pIndexTypes *IndexType
	pIndexTypeValues *uint
	pIndexTypeValues *uint
}

type IndirectCommandsLayoutCreateInfoNV {
	sType StructureType
	pNext *[]
	flags IndirectCommandsLayoutUsageFlagsNV
	pipelineBindPoint PipelineBindPoint
	tokenCount uint
	pTokens *IndirectCommandsLayoutTokenNV
	streamCount uint
	pStreamStrides *uint
	pStreamStrides *uint
}

type GeneratedCommandsInfoNV {
	sType StructureType
	pNext *[]
	pipelineBindPoint PipelineBindPoint
	pipeline Pipeline
	indirectCommandsLayout IndirectCommandsLayoutNV
	streamCount uint
	pStreams *IndirectCommandsStreamNV
	sequencesCount uint
	preprocessBuffer Buffer
	preprocessOffset DeviceSize
	preprocessSize DeviceSize
	sequencesCountBuffer Buffer
	sequencesCountOffset DeviceSize
	sequencesIndexBuffer Buffer
	sequencesIndexOffset DeviceSize
	sequencesIndexOffset DeviceSize
}

type GeneratedCommandsMemoryRequirementsInfoNV {
	sType StructureType
	pNext *[]
	pipelineBindPoint PipelineBindPoint
	pipeline Pipeline
	indirectCommandsLayout IndirectCommandsLayoutNV
	maxSequencesCount uint
	maxSequencesCount uint
}

type PhysicalDeviceTexelBufferAlignmentFeaturesEXT {
	sType StructureType
	pNext *[]
	texelBufferAlignment Bool32
	texelBufferAlignment Bool32
}

type PhysicalDeviceTexelBufferAlignmentPropertiesEXT {
	sType StructureType
	pNext *[]
	storageTexelBufferOffsetAlignmentBytes DeviceSize
	storageTexelBufferOffsetSingleTexelAlignment Bool32
	uniformTexelBufferOffsetAlignmentBytes DeviceSize
	uniformTexelBufferOffsetSingleTexelAlignment Bool32
	uniformTexelBufferOffsetSingleTexelAlignment Bool32
}

type RenderPassTransformBeginInfoQCOM {
	sType StructureType
	pNext *[]
	transform SurfaceTransformFlagBitsKHR
	transform SurfaceTransformFlagBitsKHR
}

type CommandBufferInheritanceRenderPassTransformInfoQCOM {
	sType StructureType
	pNext *[]
	transform SurfaceTransformFlagBitsKHR
	renderArea Rect2D
	renderArea Rect2D
}

type PhysicalDeviceDeviceMemoryReportFeaturesEXT {
	sType StructureType
	pNext *[]
	deviceMemoryReport Bool32
	deviceMemoryReport Bool32
}

type DeviceMemoryReportCallbackDataEXT {
	sType StructureType
	pNext *[]
	flags DeviceMemoryReportFlagsEXT
	ty DeviceMemoryReportEventTypeEXT
	memoryObjectId ulong
	size DeviceSize
	objectType ObjectType
	objectHandle ulong
	heapIndex uint
	heapIndex uint
}

type DeviceDeviceMemoryReportCreateInfoEXT {
	sType StructureType
	pNext *[]
	flags DeviceMemoryReportFlagsEXT
	pfnUserCallback PFNDeviceMemoryReportCallbackEXT
	pUserData *[]
	pUserData *[]
}

type PhysicalDeviceRobustness2FeaturesEXT {
	sType StructureType
	pNext *[]
	robustBufferAccess2 Bool32
	robustImageAccess2 Bool32
	nullDescriptor Bool32
	nullDescriptor Bool32
}

type PhysicalDeviceRobustness2PropertiesEXT {
	sType StructureType
	pNext *[]
	robustStorageBufferAccessSizeAlignment DeviceSize
	robustUniformBufferAccessSizeAlignment DeviceSize
	robustUniformBufferAccessSizeAlignment DeviceSize
}

type SamplerCustomBorderColorCreateInfoEXT {
	sType StructureType
	pNext *[]
	customBorderColor ClearColorValue
	format Format
	format Format
}

type PhysicalDeviceCustomBorderColorPropertiesEXT {
	sType StructureType
	pNext *[]
	maxCustomBorderColorSamplers uint
	maxCustomBorderColorSamplers uint
}

type PhysicalDeviceCustomBorderColorFeaturesEXT {
	sType StructureType
	pNext *[]
	customBorderColors Bool32
	customBorderColorWithoutFormat Bool32
	customBorderColorWithoutFormat Bool32
}

type PhysicalDevicePrivateDataFeaturesEXT {
	sType StructureType
	pNext *[]
	privateData Bool32
	privateData Bool32
}

type DevicePrivateDataCreateInfoEXT {
	sType StructureType
	pNext *[]
	privateDataSlotRequestCount uint
	privateDataSlotRequestCount uint
}

type PrivateDataSlotCreateInfoEXT {
	sType StructureType
	pNext *[]
	flags PrivateDataSlotCreateFlagsEXT
	flags PrivateDataSlotCreateFlagsEXT
}

type PhysicalDevicePipelineCreationCacheControlFeaturesEXT {
	sType StructureType
	pNext *[]
	pipelineCreationCacheControl Bool32
	pipelineCreationCacheControl Bool32
}

type PhysicalDeviceDiagnosticsConfigFeaturesNV {
	sType StructureType
	pNext *[]
	diagnosticsConfig Bool32
	diagnosticsConfig Bool32
}

type DeviceDiagnosticsConfigCreateInfoNV {
	sType StructureType
	pNext *[]
	flags DeviceDiagnosticsConfigFlagsNV
	flags DeviceDiagnosticsConfigFlagsNV
}

type PhysicalDeviceFragmentShadingRateEnumsFeaturesNV {
	sType StructureType
	pNext *[]
	fragmentShadingRateEnums Bool32
	supersampleFragmentShadingRates Bool32
	noInvocationFragmentShadingRates Bool32
	noInvocationFragmentShadingRates Bool32
}

type PhysicalDeviceFragmentShadingRateEnumsPropertiesNV {
	sType StructureType
	pNext *[]
	maxFragmentShadingRateInvocationCount SampleCountFlagBits
	maxFragmentShadingRateInvocationCount SampleCountFlagBits
}

type PipelineFragmentShadingRateEnumStateCreateInfoNV {
	sType StructureType
	pNext *[]
	shadingRateType FragmentShadingRateTypeNV
	shadingRate FragmentShadingRateNV
	combinerOps FragmentShadingRateCombinerOpKHR
	combinerOps FragmentShadingRateCombinerOpKHR
}

type PhysicalDeviceFragmentDensityMap2FeaturesEXT {
	sType StructureType
	pNext *[]
	fragmentDensityMapDeferred Bool32
	fragmentDensityMapDeferred Bool32
}

type PhysicalDeviceFragmentDensityMap2PropertiesEXT {
	sType StructureType
	pNext *[]
	subsampledLoads Bool32
	subsampledCoarseReconstructionEarlyAccess Bool32
	maxSubsampledArrayLayers uint
	maxDescriptorSetSubsampledSamplers uint
	maxDescriptorSetSubsampledSamplers uint
}

type CopyCommandTransformInfoQCOM {
	sType StructureType
	pNext *[]
	transform SurfaceTransformFlagBitsKHR
	transform SurfaceTransformFlagBitsKHR
}

type PhysicalDeviceImageRobustnessFeaturesEXT {
	sType StructureType
	pNext *[]
	robustImageAccess Bool32
	robustImageAccess Bool32
}

type PhysicalDevice4444FormatsFeaturesEXT {
	sType StructureType
	pNext *[]
	formatA4R4G4B4 Bool32
	formatA4B4G4R4 Bool32
	formatA4B4G4R4 Bool32
}

type AccelerationStructureBuildRangeInfoKHR {
	primitiveCount uint
	primitiveOffset uint
	firstVertex uint
	transformOffset uint
	transformOffset uint
}

type AccelerationStructureGeometryTrianglesDataKHR {
	sType StructureType
	pNext *[]
	vertexFormat Format
	vertexData DeviceOrHostAddressConstKHR
	vertexStride DeviceSize
	maxVertex uint
	indexType IndexType
	indexData DeviceOrHostAddressConstKHR
	transformData DeviceOrHostAddressConstKHR
	transformData DeviceOrHostAddressConstKHR
}

type AccelerationStructureGeometryAabbsDataKHR {
	sType StructureType
	pNext *[]
	data DeviceOrHostAddressConstKHR
	stride DeviceSize
	stride DeviceSize
}

type AccelerationStructureGeometryInstancesDataKHR {
	sType StructureType
	pNext *[]
	arrayOfPointers Bool32
	data DeviceOrHostAddressConstKHR
	data DeviceOrHostAddressConstKHR
}

type AccelerationStructureGeometryKHR {
	sType StructureType
	pNext *[]
	geometryType GeometryTypeKHR
	geometry AccelerationStructureGeometryDataKHR
	flags GeometryFlagsKHR
	flags GeometryFlagsKHR
}

type AccelerationStructureBuildGeometryInfoKHR {
	sType StructureType
	pNext *[]
	ty AccelerationStructureTypeKHR
	flags BuildAccelerationStructureFlagsKHR
	mode BuildAccelerationStructureModeKHR
	srcAccelerationStructure AccelerationStructureKHR
	dstAccelerationStructure AccelerationStructureKHR
	geometryCount uint
	pGeometries *AccelerationStructureGeometryKHR
	ppGeometries **AccelerationStructureGeometryKHR
	scratchData DeviceOrHostAddressKHR
	scratchData DeviceOrHostAddressKHR
}

type AccelerationStructureCreateInfoKHR {
	sType StructureType
	pNext *[]
	createFlags AccelerationStructureCreateFlagsKHR
	buffer Buffer
	offset DeviceSize
	size DeviceSize
	ty AccelerationStructureTypeKHR
	deviceAddress DeviceAddress
	deviceAddress DeviceAddress
}

type WriteDescriptorSetAccelerationStructureKHR {
	sType StructureType
	pNext *[]
	accelerationStructureCount uint
	pAccelerationStructures *AccelerationStructureKHR
	pAccelerationStructures *AccelerationStructureKHR
}

type PhysicalDeviceAccelerationStructureFeaturesKHR {
	sType StructureType
	pNext *[]
	accelerationStructure Bool32
	accelerationStructureCaptureReplay Bool32
	accelerationStructureIndirectBuild Bool32
	accelerationStructureHostCommands Bool32
	descriptorBindingAccelerationStructureUpdateAfterBind Bool32
	descriptorBindingAccelerationStructureUpdateAfterBind Bool32
}

type PhysicalDeviceAccelerationStructurePropertiesKHR {
	sType StructureType
	pNext *[]
	maxGeometryCount ulong
	maxInstanceCount ulong
	maxPrimitiveCount ulong
	maxPerStageDescriptorAccelerationStructures uint
	maxPerStageDescriptorUpdateAfterBindAccelerationStructures uint
	maxDescriptorSetAccelerationStructures uint
	maxDescriptorSetUpdateAfterBindAccelerationStructures uint
	minAccelerationStructureScratchOffsetAlignment uint
	minAccelerationStructureScratchOffsetAlignment uint
}

type AccelerationStructureDeviceAddressInfoKHR {
	sType StructureType
	pNext *[]
	accelerationStructure AccelerationStructureKHR
	accelerationStructure AccelerationStructureKHR
}

type AccelerationStructureVersionInfoKHR {
	sType StructureType
	pNext *[]
	pVersionData *ubyte
	pVersionData *ubyte
}

type CopyAccelerationStructureToMemoryInfoKHR {
	sType StructureType
	pNext *[]
	src AccelerationStructureKHR
	dst DeviceOrHostAddressKHR
	mode CopyAccelerationStructureModeKHR
	mode CopyAccelerationStructureModeKHR
}

type CopyMemoryToAccelerationStructureInfoKHR {
	sType StructureType
	pNext *[]
	src DeviceOrHostAddressConstKHR
	dst AccelerationStructureKHR
	mode CopyAccelerationStructureModeKHR
	mode CopyAccelerationStructureModeKHR
}

type CopyAccelerationStructureInfoKHR {
	sType StructureType
	pNext *[]
	src AccelerationStructureKHR
	dst AccelerationStructureKHR
	mode CopyAccelerationStructureModeKHR
	mode CopyAccelerationStructureModeKHR
}

type AccelerationStructureBuildSizesInfoKHR {
	sType StructureType
	pNext *[]
	accelerationStructureSize DeviceSize
	updateScratchSize DeviceSize
	buildScratchSize DeviceSize
	buildScratchSize DeviceSize
}

type RayTracingShaderGroupCreateInfoKHR {
	sType StructureType
	pNext *[]
	ty RayTracingShaderGroupTypeKHR
	generalShader uint
	closestHitShader uint
	anyHitShader uint
	intersectionShader uint
	pShaderGroupCaptureReplayHandle *[]
	pShaderGroupCaptureReplayHandle *[]
}

type RayTracingPipelineInterfaceCreateInfoKHR {
	sType StructureType
	pNext *[]
	maxPipelineRayPayloadSize uint
	maxPipelineRayHitAttributeSize uint
	maxPipelineRayHitAttributeSize uint
}

type RayTracingPipelineCreateInfoKHR {
	sType StructureType
	pNext *[]
	flags PipelineCreateFlags
	stageCount uint
	pStages *PipelineShaderStageCreateInfo
	groupCount uint
	pGroups *RayTracingShaderGroupCreateInfoKHR
	maxPipelineRayRecursionDepth uint
	pLibraryInfo *PipelineLibraryCreateInfoKHR
	pLibraryInterface *RayTracingPipelineInterfaceCreateInfoKHR
	pDynamicState *PipelineDynamicStateCreateInfo
	layout PipelineLayout
	basePipelineHandle Pipeline
	basePipelineIndex int
	basePipelineIndex int
}

type PhysicalDeviceRayTracingPipelineFeaturesKHR {
	sType StructureType
	pNext *[]
	rayTracingPipeline Bool32
	rayTracingPipelineShaderGroupHandleCaptureReplay Bool32
	rayTracingPipelineShaderGroupHandleCaptureReplayMixed Bool32
	rayTracingPipelineTraceRaysIndirect Bool32
	rayTraversalPrimitiveCulling Bool32
	rayTraversalPrimitiveCulling Bool32
}

type PhysicalDeviceRayTracingPipelinePropertiesKHR {
	sType StructureType
	pNext *[]
	shaderGroupHandleSize uint
	maxRayRecursionDepth uint
	maxShaderGroupStride uint
	shaderGroupBaseAlignment uint
	shaderGroupHandleCaptureReplaySize uint
	maxRayDispatchInvocationCount uint
	shaderGroupHandleAlignment uint
	maxRayHitAttributeSize uint
	maxRayHitAttributeSize uint
}

type StridedDeviceAddressRegionKHR {
	deviceAddress DeviceAddress
	stride DeviceSize
	size DeviceSize
	size DeviceSize
}

type TraceRaysIndirectCommandKHR {
	width uint
	height uint
	depth uint
	depth uint
}

type PhysicalDeviceRayQueryFeaturesKHR {
	sType StructureType
	pNext *[]
	rayQuery Bool32
	rayQuery Bool32
}

union ClearColorValue {
	float32 real
	int32 int
	uint32 uint
	uint32 uint
}

union ClearValue {
	color ClearColorValue
	depthStencil ClearDepthStencilValue
	depthStencil ClearDepthStencilValue
}

union PerformanceCounterResultKHR {
	int32 int
	int64 long
	uint32 uint
	uint64 ulong
	float32 real
	float64 double
	float64 double
}

union PipelineExecutableStatisticValueKHR {
	b32 Bool32
	i64 long
	u64 ulong
	f64 double
	f64 double
}

union PerformanceValueDataINTEL {
	value32 uint
	value64 ulong
	valueFloat real
	valueBool Bool32
	valueString *byte
	valueString *byte
}

union DeviceOrHostAddressKHR {
	deviceAddress DeviceAddress
	hostAddress *[]
	hostAddress *[]
}

union DeviceOrHostAddressConstKHR {
	deviceAddress DeviceAddress
	hostAddress *[]
	hostAddress *[]
}

union AccelerationStructureGeometryDataKHR {
	triangles AccelerationStructureGeometryTrianglesDataKHR
	aabbs AccelerationStructureGeometryAabbsDataKHR
	instances AccelerationStructureGeometryInstancesDataKHR
	instances AccelerationStructureGeometryInstancesDataKHR
}

