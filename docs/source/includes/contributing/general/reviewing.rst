.. raw:: html

    <style>
      span.github-green {background-color: #28a745; color: white; padding: 4px 6px; border-radius: 3px;}
      span.github-yellow {background-color: #ffcc00; color: black; padding: 4px 6px; border-radius: 3px;}
      span.github-burgundy {background-color: #981e51ff; color: white; padding: 4px 6px; border-radius: 3px;}
      span.github-purple {background-color: #6f42c1; color: white; padding: 4px 6px; border-radius: 3px;}
      span.github-grey {background-color: #6c757d; color: white; padding: 4px 6px; border-radius: 3px;}
      span.github-red {background-color: #d73a49; color: white; padding: 4px 6px; border-radius: 3px;}
      span.github-blue {background-color: #0366d6; color: white; padding: 4px 6px; border-radius: 3px;}
    </style>

.. role:: approved
   :class: sd-badge pst-badge github-green

.. role:: implementation-in-progress
   :class: sd-badge pst-badge github-yellow

.. role:: open-discussion
   :class: sd-badge pst-badge github-burgundy

.. role:: backlog
   :class: sd-badge pst-badge github-grey

.. role:: require-review
   :class: sd-badge pst-badge github-red

.. role:: drafting-phase
   :class: sd-badge pst-badge github-purple

.. role:: ready-for-pickup
   :class: sd-badge pst-badge github-blue

.. role:: on-hold
   :class: sd-badge pst-badge github-grey

Reviewing Contributions
=======================

Reviewing open pull requests (PRs) is an essential part of the contribution process.
By providing feedback and suggestions, reviewers help maintain the quality and consistency of the project and help moving it forward.
All CHORAS repositories require at least one approving reviews before a PR can be merged.
For small changes, such as fixing small issues or updating the documentation, one approving review is usually sufficient.
PRs that require a review have the status :require-review:`Require Review` in the project section.
If a PR is marked as "Draft" or has the status :drafting-phase:`Drafting Phase`, it is not yet ready for review.
Please wait until the author marks it as *Ready for Review* (or the status shows :require-review:`Require Review`) unless you have been asked to provide feedback on a draft.
This can happen through the request review feature.

Communication Guidelines
------------------------

When reviewing a PR, keep in mind that

- Every PR, good or bad, is an act of generosity. Be kind, welcoming, and empathetic to contributors. It may be someone's first contribution to the project. Opening with a positive comment will help the author feel rewarded, and your subsequent remarks may be heard more clearly.
- Make sure your comments are constructive and actionable. Provide specific suggestions for improvement rather than just pointing out problems.
- If something is unclear, ask for clarification rather than making assumptions.
- Begin if possible with the large issues, so the author knows they've been understood. Resist the temptation to immediately go line by line, or to open with small pervasive issues.
- Use the "request changes" review option if there are significant issues that need to be addressed before the PR can be merged. If you are generally positive about the PR but have some minor suggestions, use the "comment" option.
- Do not let perfect be the enemy of the good, especially if the PR has already seen more than one review iteration. If you find yourself making many small suggestions, or being too nitpicky on style or grammar, consider merging the current PR when all important concerns are addressed.
- Don't drag out the review process unnecessarily. Remaining small issues can also be resolved in a separate PR. In such cases, open a new issue and communicate this to the author and give them a chance to address the issue in a future contribution.
- Focus on the code changes, do not ask for unrelated changes or improvements which are beyond the scope of the PR.
- Do not use the PR to discuss larger design issues or future plans. Open a new issue for such discussions and link to it from the PR if necessary.
- Do not simply commit changes to the author's branch. Instead, suggest changes using GitHub's review tools. If the author agrees, they can then commit the changes themselves automatically giving credit to the reviewer.

Review Checklist
----------------

- Is the behavior, purpose, and scope of the changes made as part of the PR clear? If not, ask to the author to clarify in the PR description before continuing the review.
- Do all tests pass on the continuous integration (CI) system? See the checks panel at the bottom of the PR.
- Is the implementation sufficiently compact or modular and make use of existing functionality where possible? It might be that new contributors are not yet aware of all existing functionality.
- Are variables, functions, classes, and modules named appropriately and consistently? Does the code follow the project's `style conventions <../backend/style_design.html>`_? See if the ruff linter check passes in the CI system. See the checks panel at the bottom of the PR.
- Is the code correct and sufficiently tested? Is the test coverage sufficient? Note that we do not enforce 100% coverage for every PR, but the code should in general be well covered.
- Do the code changes follow the project's coding style and guidelines? Make sure that the ruff linter check passes in the CI system. See the checks panel at the bottom of the PR.
- Are docstrings and documentation provided or updated and are they clear and informative?

  - Check that any new functions or classes are documented in the API reference.
  - Make sure that the documentation builds without errors and renders correctly (see readthedocs.org check). Are there formatting issues with equations, code blocks, or plots?

- If you are feel that the proposed changes have larger implications for the project or need further discussions, please change the PR status to :open-discussion:`Open Discussion`. This indicates to the maintainers that further input. Such discussions can be moved to a new issue.

Maintainer Checklist
--------------------

- Make sure that there are sufficient approving reviews before merging the PR and that all requested changes have been addressed.
- Make sure that all required checks pass before merging the PR.
- In case of merge conflicts, ask the author to resolve them by rebasing the current branch onto the respective target branch.
- Ensure that the PR is targeting the correct branch and that the milestone is set appropriately. If not, adjust accordingly.
- Check if the history of the PR is sufficiently clean. If there are many small commits that do not add value to the history, ask the author to squash them into meaningful commits. If necessary, assist the author with the process. You may also choose to squash and merge the PR yourself if appropriate.
- After merging ensure that related issues are closed and that any relevant changelog entries are added. Don't forget to remove the git branch. No worries, GitHub has a restore feature if it is required in the near future.
- If you want to reject a PR, provide a clear explanation to the author why the PR is being rejected and if possible suggest alternative approaches or solutions.
- If a PR has not seen any activity in a long time or requires changes from another PR that is taking a long time, please move the status of the PR to :on-hold:`On Hold`. This avoids unnecessary reviews or commits.
