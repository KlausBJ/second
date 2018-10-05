Search "belongs_to" (35 hits in 19 files) *
  T:\second\app\models\package.rb (2 hits) *
	Line 2:   belongs_to :file_object *1
	Line 3:   belongs_to :entity_version, polymorphic: true **
  T:\second\app\models\deploy_plan_item.rb (3 hits) *
	Line 2:   belongs_to :deploy_plan *
	Line 3:   belongs_to :entity_instance, polymorphic: true **
	Line 4:   belongs_to :after_item, polymorphic: true, optional: true **
  T:\second\app\models\property.rb (1 hit) *
	Line 2:   belongs_to :owner, polymorphic: true *****
  T:\second\app\models\db_instance.rb (3 hits) *
	Line 2:   belongs_to :db_version *
	Line 3:   belongs_to :env_version *
	Line 4: 	belongs_to :ru_instance, optional: true *
  T:\second\app\models\dependee_mask.rb (3 hits) *
	Line 2:   belongs_to :dependee *
	Line 3:   belongs_to :interface *
	Line 4:   belongs_to :dependee_entity, polymorphic: true **
  T:\second\app\models\env_version.rb (1 hit) *
	Line 2:   belongs_to :environment *
  T:\second\app\models\template.rb (2 hits) *
	Line 2:   belongs_to :file_object *1
	Line 3:   belongs_to :entity_version, polymorphic: true **
  T:\second\app\models\app_version.rb (1 hit) *
	Line 2:   belongs_to :app *
  T:\second\app\models\app_instance.rb (3 hits) *
	Line 2:   belongs_to :app_version *
	Line 3:   belongs_to :env_version *
	Line 4: 	belongs_to :ru_instance, optional: true *
  T:\second\app\models\inclusion.rb (2 hits) *
	Line 2:   belongs_to :ru_version *
	Line 3:   belongs_to :entity_version, polymorphic: true **
  T:\second\app\models\script.rb (2 hits) *
	Line 2:   belongs_to :file_object *1
	Line 3:   belongs_to :entity_version, polymorphic: true **
  T:\second\app\models\dependency.rb (3 hits) *
	Line 2:   belongs_to :depender, polymorphic: true ** # app_version, db_version
	Line 3:   belongs_to :deploy_sequence *
	Line 4:   belongs_to :deploy_trigger *
  T:\second\app\models\deploy_plan.rb (1 hit) *
	Line 2:   belongs_to :env_version *
  T:\second\app\models\interface.rb (1 hit) *
	Line 2:   belongs_to :entity, polymorphic: true **
  T:\second\app\models\db_version.rb (1 hit) *
	Line 2:   belongs_to :db *
  T:\second\app\models\ru_instance.rb (2 hits) *
	Line 2:   belongs_to :ru_version *
	Line 3:   belongs_to :env_version *
  T:\second\app\models\dependee.rb (1 hit) *
	Line 2:   belongs_to :dependency *
  T:\second\app\models\ru_version.rb (1 hit) *
	Line 3:   belongs_to :release_unit *
  T:\second\app\models\interface_mapping.rb (2 hits) *
	Line 2:   belongs_to :interface *
	Line 3:   belongs_to :entity_version, polymorphic: true **
