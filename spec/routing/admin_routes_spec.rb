require 'spec_helper'

describe "Routes for Admin" do
  it "/admin" do
    expect(get: '/admin').to route_to(
      controller: "admin/customers",
      action: 'index',
      format: 'html'
    )
  end

  context "Customers" do
    it "/admin/customers" do
      expect(get: '/admin/customers').to route_to(
        controller: "admin/customers",
        action: 'index',
        format: 'html'
      )
    end

    it "/admin/customers/new" do
      expect(get: '/admin/customers/new').to route_to(
        controller: "admin/customers",
        action: 'new',
        format: 'html'
      )
    end

    it "/admin/customers" do
      expect(post: '/admin/customers').to route_to(
        controller: "admin/customers",
        action: 'create',
        format: 'html'
      )
    end

    it "/admin/customers/1/activities" do
      expect(get: '/admin/customers/1/activities').to route_to(
        controller: "admin/customers",
        action: 'activities',
        format: 'html',
        id: '1'
      )
    end

    it "/admin/customers/1/activities" do
      expect(patch: '/admin/customers/1/activities').to route_to(
        controller: "admin/customers",
        action: 'update_activities',
        format: 'html',
        id: '1'
      )
    end

    it "/admin/customers/1/payment" do
      expect(get: '/admin/customers/1/payment').to route_to(
        controller: "admin/customers",
        action: 'new_payment',
        format: 'html',
        id: '1'
      )
    end

    it "/admin/customers/1/payment" do
      expect(post: '/admin/customers/1/payment').to route_to(
        controller: "admin/customers",
        action: 'create_payment',
        format: 'html',
        id: '1'
      )
    end
  end
end
