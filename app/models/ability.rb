class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    # can :manage, :all
    can :read, Unit.find(1)
    can :read, Entry

    can :manage, Entry do |entry|
      (
        user.responsabilities.pluck(:unit_id).compact.map(&:to_s) &
        ([entry.unit.id.to_s] + (entry.unit.ancestry.nil? ? [] : entry.unit.ancestry.split("/")))
      ).any?
    end
    can :manage, Lot do |lot|
      (
        user.responsabilities.pluck(:unit_id).compact.map(&:to_s) &
        ([lot.unit.id.to_s] + (lot.unit.ancestry.nil? ? [] : lot.unit.ancestry.split("/")))
      ).any?
    end
    can :manage, Contract do |contract|
      (
        user.responsabilities.pluck(:unit_id).compact.map(&:to_s) &
        ([contract.unit.id.to_s] + (contract.unit.ancestry.nil? ? [] : contract.unit.ancestry.split("/")))
      ).any?
    end
    cannot :in, Entry do |entry|
      (
        user.responsabilities.joins(profile: :permissions).where('permissions.name': 'in', 'permissions.object': 'Entry').pluck(:unit_id).compact.map(&:to_s) &
        ([entry.unit.id.to_s] + (entry.unit.ancestry.nil? ? [] : entry.unit.ancestry.split("/")))
      ).empty?
    end
    
    cannot :destroy, :all

    user.permissions.each do |perm|
      begin
        obj = Kernel.const_get(perm.object)
        if perm.name.include? 'not-'
          cannot perm.name.split('not-')[1].to_sym, obj
        else
          can perm.name.to_sym, obj
        end
      rescue
        if perm.name.include? 'not-'
          cannot perm.name.split('not-')[1].to_sym, perm.object.to_sym
        else
          can perm.name.to_sym, perm.object.to_sym
        end
      end
    end    
  end
end
