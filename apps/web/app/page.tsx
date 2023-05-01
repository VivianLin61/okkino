import { gql } from '../data-access/graphql-client';

export default async function Index() {
  /*
   * Replace the elements below with your own.
   *
   * Note: The corresponding styles are in the ./index.css file.
   */
  const { users } = await gql.GetUsers();
  console.log(users);

  return users.map((user) => (
    <figure
      key={user.id}
      className="bg-slate-100 rounded-xl p-8 dark:bg-slate-800 text-white m-6"
    >
      <img
        className="w-24 h-24 rounded-full mx-auto"
        src={`https://i.pravatar.cc/150?u=${user.id}`}
        alt=""
        width="384"
        height="512"
      />
      <div className="pt-6 space-y-4">
        <blockquote>
          <p className="text-lg font-medium">
            “Tailwind CSS is the only framework that Ive seen scale on large
            teams. It’s easy to customize, adapts to any design, and the build
            size is tiny.”
          </p>
        </blockquote>
        <figcaption>
          <div>{user.id}</div>
          <div>{user.email}</div>
        </figcaption>
      </div>
    </figure>
  ));
}
