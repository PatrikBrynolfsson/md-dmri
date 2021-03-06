function EG = mgui_browse_setup_gui(EG, h_panel)
% function EG = mgui_browse_setup_gui(EG, h_panel)

switch (EG.c_mode)
    case 2
        v = {'off', 'on', 'on'};
        h       = [0.999 0.001];
        h_sc    = 0.98;
    case 3
        v = {'on', 'off', 'off'};
        h       = [0.8 0.2];
        h_sc    = 1.02;
end

p_left  = 0.03;
b       = 0.02;
w       = 1 - 2 * p_left;
mh      = 0.01;
h       = h / sum(h) * (1 - 2*b - numel(h) * mh);
h       = h * h_sc;


uicontrol(...
    'Style','listbox',...
    'FontSize', EG.conf.default_font_size, ...
    'Parent', h_panel, ...
    'String','No ROI selected',...
    'Interruptible', 'off', ...
    'Units', 'Normalized', ...
    'Position',[p_left b w h(2)], ...
    'Tag', EG.t_BROWSE_ROI, ...
    'Callback', EG.f_callback, ...
    'Visible', v{1});

b = b + h(2) + mh;

uicontrol(...
    'Style','listbox',...
    'FontSize', EG.conf.default_font_size, ...
    'Parent', h_panel, ...
    'String','-',...
    'Interruptible', 'off', ...
    'Units', 'Normalized', ...
    'Position',[p_left b w h(1)], ...
    'Tag', EG.t_BROWSE_FILE, ...
    'Callback', EG.f_callback);


b = b + h(1) + mh;
h_button = 0.028;
lw = 0.6;

uicontrol(...
    'Style','pushbutton',...
    'FontSize', EG.conf.default_font_size, ...
    'Parent', h_panel, ...
    'String','Open dir',...
    'Interruptible', 'off', ...
    'Units', 'Normalized', ...
    'Position',[p_left b w * lw h_button], ...
    'Tag', EG.t_BROWSE_FOLDER, ...
    'Visible', v{2}, ...
    'Callback', EG.f_callback);

uicontrol(...
    'Style','popupmenu',...
    'FontSize', EG.conf.default_font_size, ...
    'Parent', h_panel, ...
    'String', 'ext', ...
    'Interruptible', 'off', ...
    'Units', 'Normalized', ...
    'Position',[p_left + (lw+0.01) * w b w * (1-lw-0.01) h_button], ...
    'Tag', EG.t_BROWSE_EXT, ...
    'Visible', v{3}, ...
    'Callback', EG.f_callback);

end
