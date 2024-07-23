local M = {}

local function call_openai_api(prompt)
    local curl = require('plenary.curl')
    local api_key = os.getenv('OPENAI_NVIM_KEY')

    if not api_key or api_key == '' then
        vim.api.nvim_err_writeln('Error: OpenAI API key not set. Please set the OPENAI_API_KEY environment variable.')
        return nil
    end

    local response = curl.post('https://api.openai.com/v1/engines/davinci-codex/completions', {
        headers = {
            ['Content-Type'] = 'application/json',
            ['Authorization'] = 'Bearer ' .. api_key,
        },
        body = vim.fn.json_encode({
            prompt = prompt,
            max_tokens = 150,
            n = 1,
            stop = nil,
            temperature = 0.5,
        })
    })

    if response.status == 200 then
        local decoded = vim.fn.json_decode(response.body)
        if decoded and decoded.choices and decoded.choices[1] then
            return decoded.choices[1].text
        end
    end
    return nil
end

local function get_buffer_content()
    local buffer = vim.api.nvim_get_current_buf()
    local lines = vim.api.nvim_buf_get_lines(buffer, 0, -1, false)
    return table.concat(lines, "\n")
end

local function read_project_memory()
    local project_root = vim.fn.getcwd()
    local memory_file = project_root .. "/.chatgpt/memory.json"
    local file = io.open(memory_file, "r")
    if file then
        local content = file:read("*all")
        file:close()
        return vim.fn.json_decode(content) or {}
    end
    return {}
end

local function write_project_memory(memory)
    local project_root = vim.fn.getcwd()
    local memory_dir = project_root .. "/.chatgpt"
    local memory_file = memory_dir .. "/memory.json"
    vim.fn.mkdir(memory_dir, "p")
    local file = io.open(memory_file, "w")
    if file then
        file:write(vim.fn.json_encode(memory))
        file:close()
    end
end

local function update_project_memory(topic, findings)
    local memory = read_project_memory()
    memory[topic] = memory[topic] or {}
    table.insert(memory[topic], findings)
    write_project_memory(memory)
end

local function get_relevant_memory(topic)
    local memory = read_project_memory()
    local topic_memory = memory[topic] or {}
    return table.concat(topic_memory, "\n")
end

local function display_result(result)
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(result, '\n'))
    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)
    vim.api.nvim_open_win(buf, true, {
        relative = 'editor',
        width = width,
        height = height,
        row = row,
        col = col,
        border = 'rounded',
    })
end

function M.chatgpt_query_with_topic()
    vim.ui.input({ prompt = 'Enter topic: ' }, function(topic)
        if topic then
            vim.ui.input({ prompt = 'Enter your inquiry: ' }, function(inquiry)
                if inquiry then
                    local buffer_content = get_buffer_content()
                    local relevant_memory = get_relevant_memory(topic)
                    local prompt = relevant_memory .. "\n" .. buffer_content .. "\n" .. "User Inquiry: " .. inquiry
                    local response = call_openai_api(prompt)
                    if response then
                        display_result(response)
                        update_project_memory(topic, "Inquiry: " .. inquiry .. "\nResponse: " .. response)
                    else
                        vim.api.nvim_out_write("Failed to get response from ChatGPT.\n")
                    end
                end
            end)
        end
    end)
end

function M.add_finding_with_topic()
    vim.ui.input({ prompt = 'Enter topic: ' }, function(topic)
        if topic then
            vim.ui.input({ prompt = 'Enter finding: ' }, function(finding)
                if finding then
                    M.add_finding_to_topic(topic, finding)
                end
            end)
        end
    end)
end

function M.add_finding_to_topic(topic, finding)
    update_project_memory(topic, finding)
end

return M

