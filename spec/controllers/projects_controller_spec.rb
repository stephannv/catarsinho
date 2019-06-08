require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  let(:valid_attributes) { attributes_for(:project) }
  let(:invalid_attributes) { { title: '', goal: nil } }

  describe 'GET #index' do
    let!(:project) { create(:project) }

    before do
      get :index
    end

    it 'returns a success response' do
      expect(response).to be_successful
    end

    it 'assigns project list to @projects' do
      expect(assigns(:projects)).to eq [project]
    end
  end

  describe 'GET #show' do
    let!(:project) { create(:project) }

    before do
      get :show, params: { id: project.to_param }
    end

    it 'returns a success response' do
      expect(response).to be_successful
    end

    it 'assigns requested project to @project' do
      expect(assigns(:project)).to eq project
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    let(:project) { create(:project) }

    before do
      get :edit, params: { id: project.to_param }
    end

    it 'returns a success response' do
      expect(response).to be_successful
    end

    it 'assigns requested project to @project' do
      expect(assigns(:project)).to eq project
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Project' do
        expect { post :create, params: { project: valid_attributes } }.to change(Project, :count).by(1)
      end

      it 'redirects to the created project' do
        post :create, params: { project: valid_attributes }
        expect(response).to redirect_to(Project.last)
      end
    end

    context 'with invalid params' do
      it 'renders new template' do
        post :create, params: { project: invalid_attributes }
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    let(:project) { create(:project) }

    context 'with valid params' do
      let(:new_attributes) { { title: Faker::Lorem.unique.word } }

      it 'updates the requested project' do
        put :update, params: { id: project.to_param, project: new_attributes }
        project.reload
        expect(project.title).to eq new_attributes[:title]
      end

      it 'redirects to the project' do
        put :update, params: { id: project.to_param, project: valid_attributes }
        expect(response).to redirect_to(project)
      end
    end

    context 'with invalid params' do
      it 'renders edit template' do
        put :update, params: { id: project.to_param, project: invalid_attributes }
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:project) { create(:project) }

    it 'destroys the requested project' do
      delete :destroy, params: { id: project.to_param }
      expect(Project.find_by(id: project.id)).to be_nil
    end

    it 'redirects to the projects list' do
      delete :destroy, params: { id: project.to_param }
      expect(response).to redirect_to(projects_url)
    end
  end
end
