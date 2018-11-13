# common version checker for app and db
module VersionChecker
  def int_ver_unique?(version, variant_names)
    variant_names_sorted = variant_names.split(',').sort.join ','
    parent.versions.where(version: version).each do |vc|
      # if we find a <app/db>version with same version and the same set of variants with another id
      return false if variant_names_sorted == vc.variant && id != vc.id
    end
    return true
  end

  def variant
    variants.sort_by(&:name).map{ |i| i.name }.join(',')
  end

  def variant=(variant_names)
    if int_ver_unique?(version, variant_names)
      current_variants = variant.split(',')
      desired_variants = variant_names.split(',').sort
      (desired_variants - current_variants).each do |ni|
        VariantMapping.create name: ni, entity_version: self
      end
      (current_variants - desired_variants).each do |oi|
        variant = parent.variants.where(name: oi)
        VariantMapping.where(variant: variant, entity_version: self).destroy_all
      end
    end
  end
end
