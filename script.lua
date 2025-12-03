local pid = getProcessIDFromProcessName("Terraria.exe")
if pid then
    openProcess(pid)
end

local CETrainer = createForm()
CETrainer.Caption = "Terraria Immortal"
CETrainer.BorderStyle = "bsDialog"
CETrainer.Width = 400
CETrainer.Height = 270

local player_life = AddressList.getMemoryRecordByDescription("player_life")
local player_max_life = AddressList.getMemoryRecordByDescription("player_max_life")

local CELabel1 = createLabel(CETrainer)
CELabel1.Caption = "Deixar vida em:"
CELabel1.Left = 20
CELabel1.Top = 20

local CEEdit1 = createEdit(CETrainer)
CEEdit1.TextHint = "ex: 999"
CEEdit1.Text = player_life.Value
CEEdit1.Left = 20
CEEdit1.Top = 45
CEEdit1.Width = 120

local CEButton1 = createButton(CETrainer)
CEButton1.Caption = "OK"
CEButton1.Cursor = "crHandPoint"
CEButton1.Left = 160
CEButton1.Top = 42

local CEButton1Lock = createButton(CETrainer)
CEButton1Lock.Caption = "Travar valor de vida"
CEButton1Lock.Cursor = "crHandPoint"
CEButton1Lock.Left = 20
CEButton1Lock.Top = 75
CEButton1Lock.Width = 250

local CELabel2 = createLabel(CETrainer)
CELabel2.Caption = "\n"
CELabel2.Left = 20
CELabel2.Top = 105

local CELabel3 = createLabel(CETrainer)
CELabel3.Caption = "Deixar vida máxima em:"
CELabel3.Left = 20
CELabel3.Top = 135

local CEEdit2 = createEdit(CETrainer)
CEEdit2.TextHint = "ex: 999"
CEEdit2.Text = player_max_life.Value
CEEdit2.Left = 20
CEEdit2.Top = 160
CEEdit2.Width = 120

local CEButton2 = createButton(CETrainer)
CEButton2.Caption = "OK"
CEButton2.Cursor = "crHandPoint"
CEButton2.Left = 160
CEButton2.Top = 157

local CEButton2Lock = createButton(CETrainer)
CEButton2Lock.Caption = "Travar valor de vida máxima"
CEButton2Lock.Cursor = "crHandPoint"
CEButton2Lock.Left = 20
CEButton2Lock.Top = 190
CEButton2Lock.Width = 250


function CEButton1Click(sender)
    player_life.Value = CEEdit1.Text
end

function CEButton2Click(sender)
    player_max_life.Value = CEEdit2.Text
end

CEButton1.OnClick = CEButton1Click
CEButton2.OnClick = CEButton2Click

function CEButton1LockClick(sender)
    player_life.Active = not player_life.Active
    if player_life.Active then
        CEButton1Lock.Caption = "Destravar valor de vida"
    else
        CEButton1Lock.Caption = "Travar valor de vida"
    end
end

function CEButton2LockClick(sender)
    player_max_life.Active = not player_max_life.Active
    if player_max_life.Active then
        CEButton2Lock.Caption = "Destravar valor de vida máxima"
    else
        CEButton2Lock.Caption = "Travar valor de vida máxima"
    end
end

CEButton1Lock.OnClick = CEButton1LockClick
CEButton2Lock.OnClick = CEButton2LockClick

function trainerOnClose(sender)
    closeCE()
    return caFree
end

CETrainer.OnClose = trainerOnClose
