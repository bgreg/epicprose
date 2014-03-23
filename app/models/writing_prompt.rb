class WritingPrompt < ActiveRecord::Base

private
  def writing_prompt_params
    params.require(:body).permit(:body)
  end
end
