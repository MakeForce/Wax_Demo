require "TestController"
testController = TestController:init()
-- local rootVc = UIApplication:sharedApplication():keyWindow():rootViewController()
local resultVC = UIApplication:sharedApplication():delegate():getCurrentVC()
resultVC:pushViewController_animated(testController,true)
-- rootVc:presentViewController_animated_completion(testController,true,nil)