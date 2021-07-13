# frozen_string_literal: true

module GiftHelper
  def gift_creator(gift)
    if gift.added_by.role == 'elf'
      gift.added_by.role
    elsif gift.added_by.role == 'kid'
      gift.added_by.first_name
    else
      '[removed]'
    end
  end

  def gift_selected_class(gift)
    'selected' if can?(:toggle_selected, gift) && gift.selected?
  end

  def select_gift_link(gift)
    if can?(:toggle_selected, gift)
      title, btn_class = gift.selected? ? %w[Deselect btn-danger] : %w[Select btn-success]
      link_to title, [:select, user, gift], remote: true, method: :put, class: "btn btn-selection #{btn_class}"
    end
  end
end
