require 'test_helper'

class RoutesVerificationTest < ActionDispatch::IntegrationTest


test "should route to new confessions" do
assert_routing '/confessions', {controller: "confessions", action: "index"}
end

test "should route to payment create" do
assert_routing({method: 'post', path: '/payments'}, {controller: "payments", action: "create"})
end

test "should route to confession create" do
assert_routing({method: 'post', path: '/confessions'}, {controller: "confessions", action: "create"})
end

test "should route to charges create" do
assert_routing({method: 'post', path: '/charges'}, {controller: "charges", action: "create"})
end

end
