import { Box, Drawer, AppBar, Toolbar, Typography, List, ListItem, ListItemText } from '@mui/material';
import { Link } from 'react-router-dom';

export default function DashboardLayout({ children }) {
  return (
    <Box sx={{ display: 'flex' }}>
      <Drawer variant="permanent" sx={{ width: 200, flexShrink: 0 }}>
        <List>
          <ListItem button component={Link} to="/main">
            <ListItemText primary="Dashboard" />
          </ListItem>
          <ListItem button component={Link} to="/users">
            <ListItemText primary="Usuarios" />
          </ListItem>
        </List>
      </Drawer>

      <Box sx={{ flexGrow: 1 }}>
        <AppBar position="static">
          <Toolbar><Typography variant="h6">Admin Panel</Typography></Toolbar>
        </AppBar>
        <Box sx={{ p: 2 }}>{children}</Box>
      </Box>
    </Box>
  );
}
