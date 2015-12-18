require "TestController"
testController = TestController:init()
local window = UIApplication:sharedApplication():keyWindow()
local rootVc = UIApplication:sharedApplication():keyWindow():rootViewController()
rootVc:presentViewController_animated_completion(testController,true,nil)