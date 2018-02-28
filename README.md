# Tasktracker

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix


Application Design.

The application has the following functionalities
1. User Login/Register (Log in with email id)
2. The main inde page gives an option of assigning managers to users on the top left corner
3. Only the manager can assign a task to his/her user.
4. When a user enters his/her task feed, they can see their manager if one is assigned to them.
6. The status is displayed as either completed or incomplete.
7. Each task is assigned with a button to view the task in detail.
8. Every user has a profile, where they can see their employees and tasks assigned to their employees.
9. When a user enters their profile, they can assign new tasks only to their employyes
10. Once a user logs in, his login status is displayed on the top right corner of the page with the user name.
 
