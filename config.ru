require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use RecipesController
use MeatsController
use VegetablesController
use MealsController
use TypesController
use IngredientsListController
use DishesListController
run ApplicationController
