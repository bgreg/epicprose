class WritingPrompt < ActiveRecord::Base

validates_presence_of :body

private
  def writing_prompt_params
    params.require(:body).permit(:body)
  end
end
