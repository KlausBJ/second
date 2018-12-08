# Mask describing candidates for fulfilling a dependency
class DependeeMask < ApplicationRecord
  # variant_not
  # version_regex

  belongs_to :dependency, inverse_of: :dependee_masks
  belongs_to :variant, optional:true, inverse_of: :dependee_masks
  belongs_to :dependee, class_name: 'Deployable', foreign_key: :dependee_id, inverse_of: :dependee_masks

  def gt(v_string) # hvad med gte...
    v_arr = v_string.split('.')
    regex = []
    v_arr.each_with_index do |v_part, i_part|
      prefix = '^'
      prefix += (v_arr[0..i_part - 1]).map{ |part| part.to_s }.join('[.]') if i_part > 0
      digits = v_part.to_s.split('')
      digits.each_with_index do |v_digit, i_digit|
        if v_digit.to_i < 9
          d_prefix = ''
          d_prefix = '[.]' if i_part > 0
          if i_digit > 0
            d_prefix += (digits[0..i_digit - 1]).join('')
          end
          d_postfix = ''
          d_postfix = "[0-9]{#{digits.length - i_digit - 1}}"
          if v_digit == '8'
            digitmatch = '9'
          else
            digitmatch = '[' + (v_digit.to_i + 1).to_s + '-9]'
          end
          regex << "#{prefix}#{d_prefix}#{digitmatch}#{d_postfix}"
        end
      end
    end
    regex.join('|')
  end

  def lt(v_string) # må ikke have for mange cifre
    v_arr = v_string.split('.')
    regex = []
    v_arr.each_with_index do |v_part, i_part|
      prefix = '^'
      prefix += (v_arr[0..i_part - 1]).map{ |part| part.to_s }.join('[.]') if i_part > 0
      digits = v_part.to_s.split('')
      digits.each_with_index do |v_digit, i_digit|
        if v_digit.to_i > 0
          d_prefix = ''
          d_prefix = '[.]' if i_part > 0
          if i_digit > 0
            d_prefix += (digits[0..i_digit - 1]).join('')
          end
          d_postfix = ''
          d_postfix = "[0-9]{0,#{digits.length - i_digit - 1}}([^0-9]|$)"
          if v_digit == '1'
            digitmatch = '0'
            digitmatch += '?' if i_digit.zero? && digits.length > 1
          else
            digitmatch = '[0-' + (v_digit.to_i - 1).to_s + ']'
          end
          regex << "#{prefix}#{d_prefix}#{digitmatch}#{d_postfix}"
        end
      end
    end
    regex.join('|')
  end

  def eq(v_string)
    '^' + v_string.split('.').join('[.]') + '([^0-9]|$)'
  end

  def ge(v_string)
    gt(v_string) + '|' + eq(v_string)
  end

  def le(v_string)
    lt(v_string) + '|' + eq(v_string)
  end
end
