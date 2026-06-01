hl.workspace_rule({ workspace = "special:overview", gaps_out = 80 })
hl.workspace_rule({ workspace = "special:running", no_rounding = true, gaps_out = 80 })

hl.workspace_rule({ workspace = "1", gaps_out = 20, gaps_in = 10, border_size = 3 })
hl.workspace_rule({ workspace = "2", border_size = 4, gaps_out = 20 })
hl.workspace_rule({ workspace = "3", gaps_out = 30, border_size = 3 })
hl.workspace_rule({ workspace = "4", gaps_out = 50 })

for w = 5, 8 do
    hl.workspace_rule({
        workspace = tostring(w),
        gaps_out = 30,
        gaps_in = 10,
        border_size = 3
    })
end
